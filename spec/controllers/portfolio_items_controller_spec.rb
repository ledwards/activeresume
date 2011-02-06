require 'spec_helper'

describe PortfolioItemsController do
  describe "new" do
    before do
      @user = Factory(:user)
      sign_in @user
    end
    
    it "has a response of success" do
      get :new
      response.should be_success
    end

    it "renders the new action" do
      get :new
      response.should render_template(:new)
    end
    
    it "assign a new portfolio item" do
      get :new
      assigns(:portfolio_item).should be_new_record
    end
  end
  
  describe "create" do
    before do
      @user = Factory(:user)
      sign_in @user
    end
    
    context "for valid parameters" do
      before do
        @valid_params = Factory.attributes_for(:portfolio_item)
      end
      
      it "creates a new Portfolio Item record" do
        expect { post :create, :portfolio_item => @valid_params }.should change(PortfolioItem, :count).by(1)
      end
      
      it "redirects to root path" do
        post :create, :portfolio_item => @valid_params
        response.should redirect_to(root_path)
      end
    end
    
    context "for invalid parameters" do
      before do
        @invalid_params = Factory.attributes_for(:portfolio_item).reject{ |k,v| k == :title }
      end
      
      it "does not create a new Portfolio Item record" do
        expect { post :create, :portfolio_item => @invalid_params }.should_not change(PortfolioItem, :count)
      end
      
      it "renders new" do
        post :create, :portfolio_item => @invalid_params
        response.should redirect_to(new_portfolio_item_path)
      end
    end
  end
end
