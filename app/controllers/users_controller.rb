class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.find(params[:id])
  end

  def create
    @user = User.new
    @user.attributes = params[:user]
    @user.save
  end
end
