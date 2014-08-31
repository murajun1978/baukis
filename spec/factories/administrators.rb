# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :administrator do
    email "MyString"
    email_for_index "MyString"
    hashed_password "MyString"
    suspended false
  end
end
