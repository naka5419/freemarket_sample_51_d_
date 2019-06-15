class ProductImagesController < ApplicationController
  def destroy
    @product = Product.find(params[:id])
    @product.images.purge
    redirect_to "/products/#{@product.id}/edit"
  end
end
