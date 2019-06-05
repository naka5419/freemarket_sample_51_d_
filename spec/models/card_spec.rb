require 'rails_helper'
describe Card do
  describe '#pay' do

    it "is invalid without a user_id" do
    @card = build(:card, user_id: "")
    @card.valid?
    expect(@card.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a customer_id" do
    @card = build(:card, customer_id: "")
    @card.valid?
      expect(@card.errors[:customer_id]).to include("can't be blank")
    end

    it "is invalid without a card_id" do
      @card = build(:card, card_id: "")
      @card.valid?
      expect(@card.errors[:card_id]).to include("can't be blank")
    end

  end
end
