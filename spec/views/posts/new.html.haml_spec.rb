require 'rails_helper'

RSpec.describe "posts/new", :type => :view do
  before(:each) do
    assign(:post, Post.new(
      :screen_name => "MyString",
      :subject => "MyString",
      :post_text => "MyString"
    ))
  end

  it "renders new post form" do
    render
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input#post_screen_name[name=?]", "post[screen_name]"
      assert_select "input#post_subject[name=?]", "post[subject]"
      assert_select "input#post_post_text[name=?]", "post[post_text]"
    end
  end
end
