FactoryBot.define do
  factory :prato do
    name { "MyString" }
    description { "MyText" }
    price { 1.5 }
    restaurante { nil }
  end
end
