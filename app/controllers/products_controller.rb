class ProductsController < ApplicationController

  def new
    @product = Product.new
    @parent = Category.all.order("id ASC").limit(13)
  end

  def show
    @product = Product.find(params[:id])
    @size = Size.find_by(product_id: params[:id])

    category = @product.product_categories.select(:category_id)
    product_category = category.last
    category_id = product_category[:category_id]
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
    params.require(:product).permit(:name, :description, :category_id, :condition, :size, :bland, :shipping_cost, :shipping_method, :source_area, :shipping_day, :status, :buyer_id, :price, images: []).merge(seller_id: current_user.id)
  end
end
