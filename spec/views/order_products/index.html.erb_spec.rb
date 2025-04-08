require 'rails_helper'

RSpec.describe "order_products/index", type: :view do
  before(:each) do
    assign(:order_products, [
      OrderProduct.create!(
        quantity: 2,
        order: nil,
        product: nil
      ),
      OrderProduct.create!(
        quantity: 2,
        order: nil,
        product: nil
      )
    ])
  end

  it "renders a list of order_products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
