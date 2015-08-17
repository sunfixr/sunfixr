require 'rails_helper'

feature "Project User management", :type => :feature do
  let(:project){ create(:project_with_users, :with_company, id: 1)}
  let(:user){create(:user)}
 # let(:users_project) { create(:users_project, user_id: user.id, project_id: project.id, role: 'sunifixr') }

  before :each do
    allow(Project).to receive(:find_by_id).and_return(project)
    project.users_projects[0].role = 'admin'
    project.users_projects[1].role = 'sunfixr'
  end

  after :each do
    Warden.test_reset!
  end

  feature "restrict access" do
    scenario "unauthorized access" do
        visit '/project/1/users'
        expect(find('div.alert-danger')).to have_text('You are not authorized to manage users.')
    end

    feature "authorized access" do
      before :each do
        allow(user).to receive(:project_admin?).and_return(true)
        login_as(user, :scope => :user)
        visit '/project/1/users'
      end

      it "should  display the 'remove' link for each user" do
        expect(all('a.destroy_link').length).to be 2
      end

      it "should display the users email" do
        all('div.form_control_static').each_with_index{|div,i|puts div.text; expect(div.text).to eq project.users[i].email }
      end
      feature "select box for user role" do

        it "should display role select box for each user" do
          expect(all('select.form-control').length).to eq 2
        end

        it "should set the select boxes accordingly" do
          all('select').each_with_index {|select,i| expect(select.find('option[selected="selected"]').text).to eq project.users_projects[i].role}
        end

        it "should be named correctly" do
          expect(find('#project_users_projects_attributes_0_role')['name']).to eq 'project[users_projects_attributes][0][role]'
        end
      end

    end

    feature "user management" do
      let(:users_project) { create(:users_project, user_id: user.id, project_id: project.id, role: 'admin') }
      before :each do
        user.users_projects << users_project
        user.reload
        project.reload
        allow(user).to receive(:project_admin?).and_return(true)
        login_as(user, :scope => :user)
        visit '/project/1/users'
      end

      scenario "change a users role within a project" do
        select('sunfixr', from: 'project_users_projects_attributes_0_role')
        select('admin', from: 'project_users_projects_attributes_1_role')
        click_on('Update Project')
        expect(find('#project_users_projects_attributes_0_role').value).to eq 'sunfixr'
        expect(find('#project_users_projects_attributes_1_role').value).to eq 'admin'
      end

      scenario "invite users to project" do
        fill_in('emails', with: 'bobby@bogus.com')
        fill_in('invitation', with: 'hello')
        expect{click_on('Invite new sunfixrs')}.to change { ActionMailer::Base.deliveries.count }.by(1)
      end

      scenario "remove a user from site" do
        expect{
          find(:css, "a.destroy_link[href=\"/project/#{project.slug}/users/#{project.users_projects[0].id.to_s}\"]").click
        }.to change{project.users_projects.count}.by(-1)
      end
    end


  end


end