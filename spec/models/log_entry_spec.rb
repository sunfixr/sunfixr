require 'rails_helper'

RSpec.describe LogEntry, :type => :model do
  subject(:log_entry) {FactoryGirl.create(:log_entry)}
  it {should respond_to(:user)}
  it {should be_valid}

  describe "when name is not present" do
    before { log_entry.user = "" }
    it {should_not be_valid}
  end
  describe "when installation is not present" do
    before { log_entry.installation = nil }
    it {should_not be_valid}
  end


end
