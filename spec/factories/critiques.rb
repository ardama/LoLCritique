# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :critique do
    user_id 1
    video_id 1
    rating 1
    helpful false
    content "MyString"
  end
end
