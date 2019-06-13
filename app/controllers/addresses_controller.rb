class AddressesController < ApplicationController

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:postalcode, :prefecture_id, :city_name, :address_number, :building_name, :phone_number)
  end

end
