class ProductImagesController < ApplicationController
  def destroy
    @product = Product.find(params[:id])
    @product.images.purge
    redirect_to edit_product_path
  end
end
