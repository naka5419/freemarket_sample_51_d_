class SmsesController < ApplicationController

  def new
    @user = User.new
  end

end
