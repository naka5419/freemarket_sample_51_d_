class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
    @parent = Category.order("id ASC").limit(13)
  end

  def index

    @ladies = Category.bring(1)
    @mens = Category.bring(2)
    @kids = Category.bring(3)
    @cosmetics = Category.bring(7)

    @chanels = Product.where(bland: "CHANEL").reject{|e| e[:buyer_id] != nil}
    @vuittons = Product.where(bland: "LOUIS VUITTON").reject{|e| e[:buyer_id] != nil}
    @supremes = Product.where(bland: "Supreme").reject{|e| e[:buyer_id] != nil}
    @nikes = Product.where(bland: "NIKE").reject{|e| e[:buyer_id] != nil}
  end

  def search
    if params[:cat]
      @categories = Category.find(params[:cat]).children
    else
      @childCategories = Category.find(params[:childCat]).children
    end
  end

  def show
    category_id = @product.category_id
    @products = Category.find(category_id).products.reject{|e| e[:buyer_id] != nil}
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def edit
    @parent = Category.order("id ASC").limit(13)
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end


  def destroy
    if @product.destroy
      redirect_to root_path
    else
      flash[:notice] = "削除に失敗しました。"
      redirect_to productitem_path(@product)
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition, :size, :bland, :shipping_cost, :shipping_method, :source_area, :shipping_day, :status, :buyer_id, :price, images: []).merge(seller_id: current_user.id)
  end

end
