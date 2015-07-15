require 'rails_helper'
RSpec.describe "attachments", :type => :view do
  login_user
  before :each do
    @project = create(:project, attachments: [create(:attachment, notes: 'Hello World!'),create(:attachment)])
    assign(:project, @project)
    render(:template => "project/attachments/index.html.haml")
  end

  it "should display a list of attachments" do
    assert_select ".row .col-sm-4>a", :text => "Destroy".to_s, :count => 2
  end

  it "should display textareas for the notes field" do
    assert_select "#project_attachments_attributes_0_notes", text: 'Hello World!'
  end



end