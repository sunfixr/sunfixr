require 'rails_helper'

RSpec.describe Post, :type => :model do
  subject(:post) {FactoryGirl.create(:post)}
  it {should respond_to(:screen_name)}
  it {should be_valid}

  describe "when name is not present" do
    before { post.screen_name = "" }
    it {should_not be_valid}
  end

end
