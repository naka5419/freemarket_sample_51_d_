class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def index
    ladies_ids = Category.where('ancestry LIKE(?)', "1/%").select(:id)

    # @ladies = ladies_ids.map{ |id| Product.where(category_id: id) }

     @ladies = []
      ladies_ids.each do |id|
        products = id.products
        if products.present?
        @ladies << products
        end
      end
    @mens = Category.find(242).products
    @kids = Category.find(3).products
    @cosmetics = Category.find(7).products
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
    params.require(:product).permit(:name, :description, :category_id, :condition, :size, :bland, :shipping_cost, :shipping_method, :source_area, :shipping_day, :status, :price, images: []).merge(seller_id: current_user.id)
  end
end
