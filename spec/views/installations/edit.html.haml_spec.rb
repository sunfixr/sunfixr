require 'rails_helper'

RSpec.describe "installations/edit", :type => :view do
  before(:each) do
    @installation = assign(:installation, create(:installation))
  end

  it "renders the edit installation form" do
    render

    assert_select "form[action=?][method=?]", installation_path(@installation), "post" do

      assert_select "input#installation_name[name=?]", "installation[name]"

      assert_select "input#installation_slug[name=?]", "installation[slug]"
    end
  end
end
