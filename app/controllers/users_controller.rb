class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
  end

  def guess
    @user = User.new
    if User.where(user_params).present?
      @user = User.where(user_params).first
    # elsif !User.exists?(height: params[:height], weight: params[:weight])
    #   gender = ["Male", "Female"]
    #   @user = User.new(height: params[:height], weight: params[:weight], gender: gender.sample)

    #   p @user
    #    redirect_to root_path if @user.save

    end
  end

  def correct_guess
    redirect_to root_path
  end

  def incorrect_guess
    @user = User.find(params[:id])

    if @user.gender == "Male"
      @user.update_attributes(gender: "Female")
    elsif @user.gender == "Female"
      @user.update_attributes(gender: "Male")
    end
    redirect_to root_path
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:height, :weight)
  end
end
