class UsersController < ApplicationController
  def index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create
  end



end
