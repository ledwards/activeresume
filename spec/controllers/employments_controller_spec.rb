require 'spec_helper'

describe EmploymentsController do
  describe "new" do
    before do
      @user = Factory(:user)
      sign_in @user
    end
    
    it "should be successful" do
      get "new"
      response.should be_success
    end
  end
  
  describe "create" do    
    context "for valid params" do
      before do
        @user = Factory(:user)
        sign_in @user
      end
      
      let(:valid_params) { Factory.attributes_for(:employment) }
      
      it "creates a new employment record" do    
        expect { post "create", :employment => valid_params }.should change(Employment, :count).by(1)
      end
      
      it "sets flash notice" do
        post "create", :employment => valid_params
        flash[:notice].should be
      end
      
      it "redirects to dashboard" do
        post "create", valid_params
        response.should be_redirect
      end
      
    end
    
    context "for invalid params" do
      let(:invalid_params) { Factory.attributes_for(:employment).reject{ |k,v| k == "company_name" } }
      
      it "does not create a new record" do
        expect {  post "create", :employment => invalid_params }.should_not change(Employment, :count)
      end
      
      it "redirects to new" do
        post "create", invalid_params
        response.should be_redirect
      end
      
    end
  end

end
