require 'spec_helper'

describe DashboardController do

  describe "index" do
    context "when not signed in" do
      it "redirects" do
        get 'index'
        response.should be_redirect
      end
      
      it "assigns a flash alert" do
        get 'index'
        flash[:alert].should be
      end
    end
    
    context "when signed in" do
      before do
        @user = Factory(:user)
        sign_in @user
      end
      
      it "is successful" do
        get 'index'
        response.should be_success
      end
    end
  end

end
