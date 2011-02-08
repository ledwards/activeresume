require 'spec_helper'

describe ProfilesController do
  describe "#edit" do
    before do
      @user = Factory.create(:user)
      sign_in @user
    end
    
    it "assigns @profile to the user's profile" do
      get :edit
      assigns(:profile).should == @user.profile
    end
  end
  
  describe "#update" do
    context "for valid params" do
      before do
        @user = Factory.create(:user)
        sign_in @user
        @valid_params = { :email => "test_email@example.com" }
        @profile = @user.profile
      end
      
      it "updates the record with new attributes" do
        expect { put :update, { :profile => @valid_params }; @profile.reload }.should change(@profile, :email)
      end
      
      it "redirects to the dashboard" do
        put :update, :profile => @valid_params
        response.should redirect_to(user_root_path)
      end
      
      it "sets flash notice" do
        put :update, :profile => @valid_params
        flash[:notice].should be
      end
    end
  end
end
