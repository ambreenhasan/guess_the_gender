FactoryGirl.define do
  factory :user do
    gender ["Male, Female"].sample
    height rand(48..96)
    weight rand(50..700)
  end

  factory :invalid_user, parent: :user do
    gender "Male"
    height nil
    weight 5000
  end
end