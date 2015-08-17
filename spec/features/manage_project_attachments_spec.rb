require 'rails_helper'
feature "Project File management", :type => :feature  do
  let(:project){ create(:project_with_attachments, id: 1)}
  let(:user){create(:user)}
  let(:users_project) { create(:users_project, user_id: user.id, project_id: project.id, role: 'admin') }

  it 'should restrict access to logged on admins' do
    project
    visit '/project/1/attachments'
    expect(find('div.alert-danger')).to have_text "You are not authorized to manage project files."
  end

  feature 'Edit Attachments' do
    before :each do
      user.users_projects << users_project
      user.reload
      project.reload
      allow(user).to receive(:project_admin?).and_return(true)
      login_as(user, :scope => :user)
      visit '/project/1/attachments'
    end

    it "should display textareas for all of the attachments" do
      expect(all('textarea').count).to eq 2
    end


    feature 'Update Attachments' do
      it "should update the attachments in bulk" do
        fill_in('project_attachments_attributes_0_notes', with: 'hello 1')
        fill_in('project_attachments_attributes_1_notes', with: 'hello 2')
        click_on('Update Project')
        expect(find('#project_attachments_attributes_0_notes').text).to eq 'hello 1'
        expect(find('#project_attachments_attributes_1_notes').text).to eq 'hello 2'
      end
    end

    feature 'delete attachment' do
      it "should delete an attachment" do
        expect{
          find('a.destroy_link[href="/api/v1/attachments/' + project.attachments[1].id.to_s + '?return_to=%2Fproject%2F' + project.id.to_s + '%2Fattachments"]').click
        }.to change{project.attachments.count}.by(-1)
      end
    end

    feature "add Attachments", :js => true do

      def login_user
        visit '/user/sign_in'
      #  user.users_projects << users_project
        allow_any_instance_of(User).to receive(:project_admin?).and_return(true)
        fill_in('user_email',{with: user.email})
        fill_in('user_password',{with: user.password})
        click_button('Log in')
      end
      before :each do
        @myproject = create(:project_with_attachments, id: 2)
        login_user
        allow(Project).to receive(:find_by_id).and_return(@myproject)
        visit '/project/2/attachments'
      end
      it "should add a new project attachment to the list" do
        expect(page).to have_selector('#project_attachments_attributes_0_notes')
        click_on "Add a Project Attachment"
        expect(page).to have_selector('#project_attachments_attributes_2_notes')
      end

      it "should add a new project attachment to the project" do
        click_on "Add a Project Attachment"
        fill_in('project_attachments_attributes_2_notes', with: 'Notes for me')
        page.driver.execute_script('$("#project_attachments_attributes_2_attachment").unwrap()')
        expect(find('#project_attachments_attributes_2_attachment').visible?).to be_truthy
        attach_file('project_attachments_attributes_2_attachment', "#{::Rails.root}/spec/support/manual.pdf", :visible => false)
        click_on('Update Project')
        expect(page.all('a.destroy_link').count).to eq 3
      end

      it "should not upload a file with an unacceptable file extention" do
        pending "this throws an exception when using js.  works in browser though."
        assert false
        #click_on "Add a Project Attachment"
        #fill_in('project_attachments_attributes_2_notes', with: 'Notes for me')
        #page.driver.execute_script('$("#project_attachments_attributes_2_attachment").unwrap()')
        #attach_file('project_attachments_attributes_2_attachment', "#{::Rails.root}/spec/support/test.abc", :visible => false)
        #click_on('Update Project')
        #page.save_screenshot("#{::Rails.root}/tmp/capybara/screenshot.png")
        #expect(page.all('a.destroy_link').count).to eq 2
      end
    end
  end

  feature "Download a file" do
    before :each do
      project
      visit '/project/1'
      click_on 'Project Files'
    end
    it "should list all of the files" do
      expect(all('a.file-link').count).to eq 2
    end

    it "should allow the download of a file" do
      all("a.file-link")[0].click
      expect(page.response_headers['Content-Type']).to eq('image/jpeg')
      expect(page.response_headers['Content-Length']).to eq('10609')
    end
  end

end