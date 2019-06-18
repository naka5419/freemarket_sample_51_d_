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


  def destroy
    if Product.find(params[:id]).destroy
      redirect_to root_path
    else
      flash[:notice] = "削除に失敗しました。"
      @product = Product.find(params[:id])
      redirect_to productitem_path(@product)
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition, :size, :bland, :shipping_cost, :shipping_method, :source_area, :shipping_day, :status, :price, images: []).merge(seller_id: current_user.id)
  end
end
