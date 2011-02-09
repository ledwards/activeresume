require 'spec_helper'

describe PublicationsController do
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

  it "assigns a new project" do
    get :new
      assigns(:publication).should be_new_record
    end
  end

  describe "create" do
    context "for valid params" do
      before do
        @user = Factory(:user)
        sign_in @user
        @valid_params = Factory.attributes_for(:publication)
      end

      it "creates a new record" do
        expect { post :create, :publication => @valid_params }.should change(Publication, :count).by(1)
      end

      it "redirects to dashboard" do
        post :create, :publication => @valid_params
        response.should redirect_to(dashboard_path)
      end

      it "sets flash notice" do
        post :create, :publication => @valid_params
        flash[:notice].should be
      end

      it "sets user_id to the current user" do
        post :create, :publication => @valid_params
        Publication.last.user_id.should == @user.id
      end
    end

    context "for invalid params" do
      before do
        @user = Factory(:user)
        sign_in @user
        @invalid_params = Factory.attributes_for(:publication, :title => nil)
      end

      it "does not create a new record" do
        expect { post :create, :publication => @invalid_params }.should_not change(Publication, :count)
      end

      it "renders new" do
        post :create, :publication => @invalid_params
        response.should render_template(:new)
      end

      it "sets flash alert" do
        post :create, :publication => @invalid_params
        flash[:alert].should be
      end
    end

  end
end
