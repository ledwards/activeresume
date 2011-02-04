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
    before do
      @user = Factory.create(:user)
      sign_in @user
      @valid_params = { :profile => { :phone => "555-555-5550" } }
      @invalid_params = { :profile => { :foo => "bar" } }
    end

    context "for valid params" do
      it "updates the record with new attributes" do
        post :update, :with => @valid_params
        @user.profile.phone.should == @valid_params[:phone]
      end
      
      it "redirects to the dashboard" do
        post :update, :with => @valid_params
        response.should redirect_to(user_root_path)
      end
    end
    
    context "for invalid params" do
    end
    
  end
  
end
