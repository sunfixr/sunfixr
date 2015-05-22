require 'rails_helper'

RSpec.describe "api/v1/log_entries/index", :type => :view do
  before(:each) do
    component =FactoryGirl.build(:component, id: 100)
    assign(:log_entries, [
      FactoryGirl.create(:log_entry, user: 'User', comments: 'Comments', component: component ),
      FactoryGirl.create(:log_entry, user: 'User', comments: 'Comments', component: component)
    ])
  end

  it "renders a list of log_entries" do
    render
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "100".to_s, :count => 2
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
