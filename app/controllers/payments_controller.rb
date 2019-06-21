class PaymentsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user)
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params["payjp_token"].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params["payjp_token"])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to new_close_path
      else
        redirect_to action: "pay"
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @product[:buyer_id] = current_user.id
    @product.save
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "purchase/show"
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    end
  end
end
