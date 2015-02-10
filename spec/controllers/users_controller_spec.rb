require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "UsersController" do
    context "#guess" do
      it "returns gender if height and weight already exist" do
        expect {
          post :guess, :user => FactoryGirl.attributes_for(:user)
          expect(response).to be_redirect
        }.to_not change {User.count}
      end

      it "creates a new User with height and weight if query doesn't exist" do
      end
    end

    context "#incorrect_guess" do
      it "updates the gender attribute if the guess is not correct" do
      end

      it "updates the gender to Male if incorrect guess was female" do
      end

      it "updates the gender to Female if incorrect guess was Male" do
      end
    end

    context "#correct_guess" do
      it "redirects to the root path if the guess is correct" do
      end
    end
  end
end
