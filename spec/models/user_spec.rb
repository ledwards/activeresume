require 'spec_helper'

describe User do
  
  it { should validate_presence_of :password }
  
  it "has a valid factory" do
    user = Factory.build(:user)
    user.should be_valid
  end
end
