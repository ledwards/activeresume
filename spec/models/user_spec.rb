require 'spec_helper'

describe User do
  
  it { should validate_presence_of :password }
  
  it "has a valid factory" do
    user = Factory.build(:user)
    user.should be_valid
  end
  
  context "callbacks" do
    describe "before_create" do
      it "calls #create_profile" do
        user = Factory.build(:user)
        user.should_receive(:create_profile)
        user.save!
      end
    end
  end
  
  describe "#create_profile" do
    context "user does not have a profile" do
      it "creates a valid profile associated with the user model" do
        user = Factory.build(:user)
        user.create_profile
        user.profile.should be_valid
      end
    end
    
    context "user has a profile" do
      it "does not change the existing profile" do
        user = Factory.build(:user)
        profile = Profile.new
        user.profile = profile
        
        user.create_profile
        user.profile.should == profile
      end
    end
  end
  
  describe "#display_name" do
    it "returns email address for an empty name" do
      user = Factory(:user)
      user.display_name.should == user.email
    end
    
    it "returns a full name if it exists" do
      user = Factory(:user)
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      user.profile.update_attributes(:first_name => first_name, :last_name => last_name)
      user.display_name.should == "#{first_name} #{last_name}"
    end
  end
end
