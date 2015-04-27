require 'rails_helper'

RSpec.describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :screen_name => "Screen Name",
        :subject => "Post",
        :post_text => "Post Text"
      ),
      Post.create!(
          :screen_name => "Screen Name",
          :subject => "Post",
          :post_text => "Post Text"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Post".to_s, :count => 2
    assert_select "tr>td", :text => "Post Text".to_s, :count => 2
  end
end
