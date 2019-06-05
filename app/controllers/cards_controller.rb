class CardsController < ApplicationController

  require "payjp"

  def index
    card = Card.where(user_id: current_user)
    redirect_to action: "show" if card.exists?
  end

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
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user)
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "index"
  end

  def show
    card = Card.where(user_id: current_user)
    if card.blank?
      redirect_to action: "index"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
