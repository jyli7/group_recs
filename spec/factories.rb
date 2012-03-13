FactoryGirl.define do
  factory :user do
    email 'test_user@gmail.com' 
  end
  
  factory :friend do |f|
    f.sequence(:user_id) { |n| "#{n}" }
    f.sequence(:name) { |n| "Friend number #{n}" }
  end
end