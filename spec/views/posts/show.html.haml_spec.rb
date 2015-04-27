require 'rails_helper'

RSpec.describe "posts/show", :type => :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :screen_name => "Screen Name",
      :subject => "Subject",
      :post_text => "Post Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Screen Name/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Post Text/)
  end
end
