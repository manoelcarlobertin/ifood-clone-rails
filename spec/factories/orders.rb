FactoryBot.define do
  factory :order do
    name { "MyString" }
    mobile_phone { "MyString" }
    total_value { 1.5 }
    city { "MyString" }
    neighborhood { "MyString" }
    number { "MyString" }
    complement { "MyString" }
    status { 1 }
    restaurante { nil }
  end
end
