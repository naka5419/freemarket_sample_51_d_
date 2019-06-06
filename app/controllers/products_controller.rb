class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    @product = Product.create(product_params)
    logger.debug @product.errors.inspect
  end

  def buy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "index"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private
  def product_params
    params.require(:product).permit(:images, :name, :description, :condition, :shipping_cost, :shipping_method, :source_area, :shipping_day, :status, :price)
  end
end
