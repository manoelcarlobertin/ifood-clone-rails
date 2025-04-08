FactoryBot.define do
  factory :restaurante do
    name { "MyString" }
    description { "MyText" }
    delivery_tax { 1.5 }
    city { "MyString" }
    street { "MyString" }
    neighborhood { "MyString" }
    number { "MyString" }
    complement { "MyString" }
    category { nil }
  end
end
