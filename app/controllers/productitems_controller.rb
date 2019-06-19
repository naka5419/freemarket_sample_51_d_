class ProductitemsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @products = Product.where(category_id: @product.category_id)
  end

end
