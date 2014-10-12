# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :property do
    title "MyString"
    description "MyText"
    price "9.99"
    city_name "MyString"
  end
end
