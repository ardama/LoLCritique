# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    user_id 1
    rating 1
    champ "MyString"
    focus "MyString"
    position "MyString"
    phase "MyString"
  end
end
