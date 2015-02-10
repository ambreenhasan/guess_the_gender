require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

    context "#guess" do
      it "retreives User data if height and weight already exists" do
        expect { get :guess, :user => FactoryGirl.attributes_for(:user)
        }.to_not change {User.count}
      end

      it "creates a new User with height and weight if query doesn't exist" do
         expect {
          post :guess, :user => FactoryGirl.attributes_for(:nonexisting_user)
          expect(response).to be_redirect
        }.to change {User.count}
      end
    end

    context "#incorrect_guess" do

      it "updates the gender to Male if incorrect guess was Female" do
        @user = FactoryGirl.create(:user)
        @attr = {:gender => "Male"}
        patch :incorrect_guess, :id => @user.id, :user => @attr
        @user.reload
        expect(@user.gender).to eq("Male")
      end

      it "updates the gender to Female if incorrect guess was Male" do
        @user = FactoryGirl.create(:user)
        @attr = {:gender => "Female"}
        patch :incorrect_guess, :id => @user.id, :user => @attr
        expect(@user.gender).to eq("Female")
      end
    end

    context "#correct_guess" do
      it "redirects to the root path if the guess is correct" do
        expect { get :correct_guess, :user => FactoryGirl.attributes_for(:user)
          expect(response).to be_redirect
        }
      end
    end
end
