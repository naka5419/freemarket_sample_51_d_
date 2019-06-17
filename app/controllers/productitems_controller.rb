class ProductitemsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    category_id = @product.category_id
    @products = Category.find(category_id).products
  end

  def index
  end

  def edit

  end

end
