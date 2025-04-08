require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      name: "MyString",
      mobile_phone: "MyString",
      total_value: 1.5,
      city: "MyString",
      neighborhood: "MyString",
      number: "MyString",
      complement: "MyString",
      status: 1,
      restaurante: nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[name]"

      assert_select "input[name=?]", "order[mobile_phone]"

      assert_select "input[name=?]", "order[total_value]"

      assert_select "input[name=?]", "order[city]"

      assert_select "input[name=?]", "order[neighborhood]"

      assert_select "input[name=?]", "order[number]"

      assert_select "input[name=?]", "order[complement]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[restaurante_id]"
    end
  end
end
