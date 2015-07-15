require 'rails_helper'
RSpec.describe "attachments", :type => :view do
  login_user
  before :each do
    @project = create(:project, attachments: [create(:attachment, notes: 'Hello World!'),create(:attachment)])
    assign(:project, @project)
    render(:template => "project/attachments/list.html.haml")
  end

  it "should display a list of attachments" do
    assert_select ".row .col-sm-6>a.file-link", :count => 2
  end

  it "should display the notes field in a 'well'" do
    assert_select ".row .col-sm-6 div.well", text: 'Hello World!'
  end



end