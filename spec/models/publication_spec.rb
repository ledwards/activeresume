require 'spec_helper'

describe Publication do
  context "validations" do
    it { should validate_presence_of :title }
  end

  describe "factory" do
    it "has a valid factory" do
      Factory.build(:publication).should be_valid
    end
  end
end
