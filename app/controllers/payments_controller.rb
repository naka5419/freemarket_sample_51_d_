class PaymentsController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @product = Product.find(params[:id])
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
