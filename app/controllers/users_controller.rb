class UsersController < ApplicationController
  def index
    # @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save && @user.exists?(height: params[:height], weight: params[:weight])
      @user.where(:height: params[:height], weight: params[:weight]).first
      render
    elsif @user.save && !@user.exists?(height: params[:height], weight: params[:weight])
      gender = ["Male", "Female"]
      @user.create(height: params[:height], weight: params[:weight], gender: gender.sample)
    end
    # redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:height, :weight)
  end
end
