FactoryGirl.define do
  factory :user do
    gender "Female"
    height 70
    weight 120
  end

  factory :nonexisting_user, parent: :user do
    gender "Male"
    height 65
    weight 200
  end

  factory :invalid_user, parent: :user do
    gender "Male"
    height nil
    weight 5000
  end
end