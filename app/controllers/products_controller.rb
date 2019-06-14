class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    category_id = @product.category_id
    @products = Category.find(category_id).products
  end

  def create
    @product = Product.create(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition, :size, :bland, :shipping_cost, :shipping_method, :source_area, :shipping_day, :status, :price, images: [])
  end
end
