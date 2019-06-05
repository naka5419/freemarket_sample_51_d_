class PurchaseController < ApplicationController

  require 'payjp'

  def index
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: 15500,
    customer: card.customer_id,
    currency: 'jpy'
  )
  redirect_to action: 'index'
  end

end