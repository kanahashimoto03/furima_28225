class UsersController < ApplicationController
  def index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      render 'new'   
    end
  end

  def destroy
  end




end
