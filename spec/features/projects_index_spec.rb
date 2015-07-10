require 'rails_helper'
feature "Projects Page", :type => :feature do
  let(:project){ create(:project_with_company, id: 1, project_pics: create_pair(:project_pic, notes: 'Notes'))}

  describe "un-logged on user" do
    before :each do
      allow(Project).to receive(:all).and_return([project])
      visit '/projects'
    end

    it 'should display the header' do
      expect(page).to have_content 'Current Projects'
    end
    it 'should display the Project name' do
      expect(page).to have_content project.name
    end

    it "should not have a 'New Project' link" do
      expect(page).not_to have_link('New Project')
    end

  end

  describe "root admin" do
    let(:user){create(:user, role: 'admin')}

    before :each do
      allow(user).to receive(:admin?).and_return(true)
      login_as(user, :scope => :user)
      visit '/projects'
    end

    it "should have a 'New Project' link" do
      expect(page).to have_button('New Project')
    end

    it "should have a new project link that goes to new project page" do
      click_button('New Project')
      expect(page).to have_content('New Project')
    end
  end

end
