require 'spec_helper'

describe DashboardController do

  describe "index" do
    context "when not signed in" do
      it "redirects" do
        get :index
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
        get :index
        response.should be_success
      end
      
      it "assigns employments" do
        employment = Factory.create(:employment, :user_id => @user.id)
        get :index
        assigns[:employments].should == [employment]
      end
      
      it "assigns educations" do
        education = Factory.create(:education, :user_id => @user.id)
        get :index
        assigns[:educations].should == [education]
      end
      
      it "assigns portfolio items" do
        portfolio_item = Factory.create(:portfolio_item, :user_id => @user.id)
        get :index
        assigns[:portfolio_items].should == [portfolio_item]
      end
    end
  end

end
