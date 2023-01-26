FactoryBot.define do 
  factory :user do 
    association :account, factory: :account, strategy: :build #added line 
    name {"MyString"}
    email { Faker::Internet.email } 
    password {"123ewq"}
    password_confirmation {"123ewq"}
  end 
end
