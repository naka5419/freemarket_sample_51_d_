class ProductsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @product = Product.find(params[:id])
    @size = Size.find_by(product_id: params[:id])

    category = @product.product_categories.select(:category_id)
    product_category = category.last
    category_id = product_category[:category_id]

    @products = Category.find(category_id).products
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

end
