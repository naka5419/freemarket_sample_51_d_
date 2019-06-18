class ProfilesController < ApplicationController
  def edit_address
  end

  def edit
  end

  def index
  end

  def show
    @products = User.find(current_user.id).selling_products
  end

end
