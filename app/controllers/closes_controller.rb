class ClosesController < ApplicationController

  def new
    @user = User.new
  end

end
