class ProductImagesController < ApplicationController
  def new
    @product_image = Product.new
  end

  def create
    @product_image = Product.create params.require(:product_image).permit(:content, :images)
    redirect_to @product_image
  end

  def show
    @product_image = Product.find(params[:id])
  end

  def edit
    @product_image = Product.find(params[:id])
  end

  def update
    @product_image = Product.find(params[:id])
    @product_image.update params.require(:content).permit(:content, :images)
  end
end
