class UsersController < ApplicationController
  def index
  end


  def new
  end

  def show
    @user = current_user
  end

  def destroy

  end

end
