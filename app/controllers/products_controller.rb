class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create params.require(:product).permit(:description, :images)
    redirect_to @product
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update params.require(:description).permit(:description, :images)
    redirect_to @product
  end
end
