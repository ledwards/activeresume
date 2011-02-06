require 'spec_helper'

describe ProjectsController do
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
    
    it "assign a new project" do
      get :new
      assigns(:project).should be_new_record
    end
  end
  
  describe "create" do
    before do
      @user = Factory(:user)
      sign_in @user
    end
    
    context "for valid parameters" do
      before do
        @valid_params = Factory.attributes_for(:project)
      end
      
      it "creates a new Project record" do
        expect { post :create, :project => @valid_params }.should change(Project, :count).by(1)
      end
      
      it "redirects to root path" do
        post :create, :project => @valid_params
        response.should redirect_to(root_path)
      end
    end
    
    context "for invalid parameters" do
      before do
        @invalid_params = Factory.attributes_for(:project).reject{ |k,v| k == :title }
      end
      
      it "does not create a new Project record" do
        expect { post :create, :project => @invalid_params }.should_not change(Project, :count)
      end
      
      it "renders new" do
        post :create, :project => @invalid_params
        response.should redirect_to(new_project_path)
      end
    end
  end
end
