class ProfilesController < ApplicationController
  def edit_address
  end

  def edit
  end

  def index
  end

  def show
    @user = User.find(current_user.id)
    @products = @user.selling_products
  end

end
