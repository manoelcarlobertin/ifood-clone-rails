require 'rails_helper'

RSpec.describe "pratos/index", type: :view do
  before(:each) do
    assign(:pratos, [
      Prato.create!(
        name: "Name",
        description: "MyText",
        price: 2.5,
        restaurante: nil
      ),
      Prato.create!(
        name: "Name",
        description: "MyText",
        price: 2.5,
        restaurante: nil
      )
    ])
  end

  it "renders a list of pratos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
