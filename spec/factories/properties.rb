# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :property do
    businessName "MyString"
    streetAddress "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    mdu false
    units "9.99"
    content "MyText"
    user nil
  end
end
