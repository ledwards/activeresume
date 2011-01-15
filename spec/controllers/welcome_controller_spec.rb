require 'spec_helper'

describe WelcomeController do

  describe "index" do
    before do
      @user = Factory(:user)
      sign_in @user
    end
    
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
