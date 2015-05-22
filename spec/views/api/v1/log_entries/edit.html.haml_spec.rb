require 'rails_helper'

RSpec.describe "api/v1/log_entries/edit", :type => :view do
  before(:each) do
    @log_entry = assign(:log_entry, FactoryGirl.create(:log_entry))
  end

  it "renders the edit log_entry form" do
    render

    assert_select "form[action=?][method=?]", api_v1_log_entry_path(@log_entry), "post" do

      assert_select "input#log_entry_user[name=?]", "log_entry[user]"

      assert_select "input#log_entry_component_id[name=?]", "log_entry[component_id]"

      assert_select "input#log_entry_comments[name=?]", "log_entry[comments]"
    end
  end
end
