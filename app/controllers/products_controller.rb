class ProductsController < ApplicationController

  def index
  end

  def new
  end  
  
  def show
    @product = Product.find(params[:id])
  end

  def buy
  end

end
