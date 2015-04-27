require 'rails_helper'

RSpec.describe "log_entries/new", :type => :view do
  let(:component){create :component}
  before(:each) do
    assign(:log_entry, LogEntry.new(
      :user => "MyString",
      :component_id => component.id,
      :comments => "MyString"
    ))
  end

  it "renders new log_entry form" do
    render

    assert_select "form[action=?][method=?]", log_entries_path, "post" do

      assert_select "input#log_entry_user[name=?]", "log_entry[user]"

      assert_select "input#log_entry_component_id[name=?]", "log_entry[component_id]"

      assert_select "input#log_entry_comments[name=?]", "log_entry[comments]"
    end
  end
end
