class UsersController < ApplicationController


  def index
  end

  def sms
    @user = User.new
  end

  def address
    @user = User.new
  end

  def payment
    @user = User.new
  end

  def close
    @user = User.new
  end
  
  def new
  end

end
