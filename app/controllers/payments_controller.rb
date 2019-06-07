class PaymentsController < ApplicationController

  def new
    @user = User.new
  end

end
