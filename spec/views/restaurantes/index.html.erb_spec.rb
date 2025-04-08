require 'rails_helper'

RSpec.describe "restaurantes/index", type: :view do
  before(:each) do
    assign(:restaurantes, [
      Restaurante.create!(
        name: "Name",
        description: "MyText",
        delivery_tax: 2.5,
        city: "City",
        street: "Street",
        neighborhood: "Neighborhood",
        number: "Number",
        complement: "Complement",
        category: nil
      ),
      Restaurante.create!(
        name: "Name",
        description: "MyText",
        delivery_tax: 2.5,
        city: "City",
        street: "Street",
        neighborhood: "Neighborhood",
        number: "Number",
        complement: "Complement",
        category: nil
      )
    ])
  end

  it "renders a list of restaurantes" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Street".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Neighborhood".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Complement".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
