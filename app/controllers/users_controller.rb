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
    elsif !(User.where(user_params).present?)
      gender = ["Male", "Female"]
      p params
      puts "hello inside else if statement"
      @user = User.new(user_params)
      p @user
      redirect_to users_guess_path if @user.save
    end
  end

  def correct_guess
    @user = User.find(params[:id])
     redirect_to root_path if @user.update_attributes(gender: params[:gender])
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
    params.fetch(:user, {}).permit(:gender,:height, :weight)
  end
end
