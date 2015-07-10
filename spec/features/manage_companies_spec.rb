require 'rails_helper'
feature "Company management", :type => :feature do
  let(:user){create(:user)}
  def login_user
    visit '/user/sign_in'
    user.users_projects << users_project
    allow_any_instance_of(User).to receive(:admin?).and_return(true)
    fill_in('user_email',{with: user.email})
    fill_in('user_password',{with: user.password})
    click_button('Log in')
  end
  before :each do
    allow(user).to receive(:admin?).and_return(true)
    login_as(user, :scope => :user)
    visit '/api/v1/companies'
  end

  feature 'Add new company' do
    let(:company_name){Faker::Company.name}
    let(:company_notes){Faker::Company.catch_phrase}
    before :each do
      click_link('New Company')
      fill_in('company_name',with: company_name)
      fill_in('company_notes',with:  company_notes)
      click_button('Save')
    end
    it 'should be successful' do
      expect(page).to have_text('Company was successfully created.')
    end

    it 'should save the company name' do
      expect(page).to have_text(company_name)
    end
    it 'should save the notes' do
      expect(page).to have_text(company_notes)
    end
    
  end





end