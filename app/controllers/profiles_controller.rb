class ProfilesController < ApplicationController
  def edit_address
  end

  def edit
  end

  def index
  end

  def show
    @products = current_user.selling_products
  end

end
