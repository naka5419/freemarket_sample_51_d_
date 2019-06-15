class ProfilesController < ApplicationController
  def edit_address
  end

  def edit
  end

  def index
  end

  def show
      @product = Product.where("product.seller_id = ? and product.status = ?", "current_user.id", "0")
  end

end
