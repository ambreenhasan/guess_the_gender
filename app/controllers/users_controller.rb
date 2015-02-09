class UsersController < ApplicationController
  def index
    # @user = User.all
  end

  def new
  end

  def create
    # create a new user
    #if the height and weight dimensions already exist, display male or female
    # if not, create a new record and at random display male or female and save to the database
    # add this logic to model
  end

  private

  def user_params
  end
end
