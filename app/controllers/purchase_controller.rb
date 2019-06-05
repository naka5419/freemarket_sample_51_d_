class PurchaseController < ApplicationController

  require 'payjp'

  def index
  end

  def pay
    card = Card.where(user_id: current_user)
    if card.blank?
      redirect_to action: "show"
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: 15500,
      customer: card.customer_id,
      currency: 'jpy'
    )
    redirect_to action: 'index'
    end
  end
end
