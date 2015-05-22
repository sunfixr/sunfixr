require 'rails_helper'

RSpec.describe "api/v1/log_entries/show", :type => :view do
  before(:each) do
    component =FactoryGirl.build(:component, id: 100)
    assign(:log_entry,  FactoryGirl.create(:log_entry, user: 'User', comments: 'Comments', component: component))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Component/)
    expect(rendered).to match(/Comments/)
  end
end
