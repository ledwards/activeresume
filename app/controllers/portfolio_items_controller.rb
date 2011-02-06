class PortfolioItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  load_and_authorize_resource
  skip_authorize_resource :only => [:show]
    
  def new
  end
  
  def create
    @portfolio_item.user_id = current_user.id
    if @portfolio_item.save
      redirect_to root_path
    else
      redirect_to new_portfolio_item_path
    end
  end

end