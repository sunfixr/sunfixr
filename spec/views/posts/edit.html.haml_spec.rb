require 'rails_helper'

RSpec.describe "posts/edit", :type => :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :screen_name => "MyString",
      :post_text => "MyString"
    ))
  end

  it "renders the edit post form" do
    render
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_screen_name[name=?]", "post[screen_name]"
      assert_select "input#post_subject[name=?]", "post[subject]"
      assert_select "input#post_post_text[name=?]", "post[post_text]"
    end
  end
end
