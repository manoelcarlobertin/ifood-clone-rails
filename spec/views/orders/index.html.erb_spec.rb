require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        name: "Name",
        mobile_phone: "Mobile Phone",
        total_value: 2.5,
        city: "City",
        neighborhood: "Neighborhood",
        number: "Number",
        complement: "Complement",
        status: 3,
        restaurante: nil
      ),
      Order.create!(
        name: "Name",
        mobile_phone: "Mobile Phone",
        total_value: 2.5,
        city: "City",
        neighborhood: "Neighborhood",
        number: "Number",
        complement: "Complement",
        status: 3,
        restaurante: nil
      )
    ])
  end

  it "renders a list of orders" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Mobile Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Neighborhood".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Complement".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
