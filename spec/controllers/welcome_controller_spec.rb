require 'spec_helper'

describe WelcomeController do

  describe "index" do
    context "when not signed in" do
      it "is successful" do
        get 'index'
        response.should be_success
      end
    end
    
    context "when signed in" do
      before do
        @user = Factory(:user)
        sign_in @user
      end
      
      it "redirects" do
        get 'index'
        response.should be_redirect
      end
    end
  end

end
