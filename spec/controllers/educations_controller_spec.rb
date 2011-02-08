require 'spec_helper'

describe EducationsController do
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
  
  describe :create do    
    context "for valid params" do
      before do
        @user = Factory(:user)
        sign_in @user
      end
      
      let(:valid_params) { Factory.attributes_for(:education) }
      
      it "creates a new education record" do    
        expect { post :create, :education => valid_params }.should change(Education, :count).by(1)
      end
      
      it "sets flash notice" do
        post :create, :education => valid_params
        flash[:notice].should be
      end
      
      it "redirects to dashboard" do
        post :create, :education => valid_params
        response.should be_redirect
      end
    end
    
    context "for invalid params" do
      before do
        @user = Factory(:user)
        sign_in @user
      end
      
      let(:invalid_params) { Factory.attributes_for(:education, :institution_name => "") }
      
      it "does not create a new record" do
        expect {  post :create, :education => invalid_params }.should_not change(Education, :count)
      end
      
      it "renders new" do
        post :create, :education => invalid_params
        response.should render_template :new
      end
      
      it "sets flash alert" do
        post :create, :education => invalid_params
        flash[:alert].should be
      end
    end
  end

end
