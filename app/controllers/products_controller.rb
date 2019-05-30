class ProductsController < ApplicationController

  def index
  end

  def new
  end  
  
  def show
    @product = Product.find(params[:id])
    @bland = Bland.find(@product.bland_id)
    @user = User.find(@product.user_id)
  end 

  def buy
  end


end
