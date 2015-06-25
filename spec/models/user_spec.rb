require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user_admin){create(:user, role: 'admin')}
  let(:user_sunfixr){create(:user, email: 'sunfixr@gmail.com')}
  let(:project){create(:project, name: 'Project x')}
  describe "roles" do

    it "should know if user is an admin" do
      expect(user_admin.admin?).to be_truthy
    end

    it "should not let a user with sunfixr role be an admin" do
      expect(user_sunfixr.admin?).to be_falsey
    end

    describe "sunfixr" do
      let(:user_project){create(:users_project, project_id: project.id, user_id: user_sunfixr.id, role: 'sunfixr')}
      before :each do
       # user_sunfixr
       # project
        user_project
      end
      it "should let a user with sunfixr role should be a sunfixr" do
        expect(user_sunfixr.sunfixr?(project.id)).to be_truthy
      end

      it "should not let a user with admin role should be a sunfixr" do
        expect(user_admin.sunfixr?(project.id)).to be_falsey
      end
    end

    describe "project_admin" do
      let(:user_project){create(:users_project, project_id: project.id, user_id: user_sunfixr.id, role: 'admin')}
      before :each do
        user_project
      end
      it "should let a user with an admin role should be a sunfixr" do
        expect(user_sunfixr.sunfixr?(project.id)).to be_truthy
      end
      it "should let a user with an admin role should be a project_admin" do
        expect(user_sunfixr.project_admin?(project.id)).to be_truthy
      end
      it "should not let a user with project admin role should be a general admin" do
        expect(user_sunfixr.admin?).to be_falsey
      end

    end



  end
end
