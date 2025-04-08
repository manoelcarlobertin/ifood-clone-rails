require 'rails_helper'

RSpec.describe "order_products/new", type: :view do
  before(:each) do
    assign(:order_product, OrderProduct.new(
      quantity: 1,
      order: nil,
      product: nil
    ))
  end

  it "renders new order_product form" do
    render

    assert_select "form[action=?][method=?]", order_products_path, "post" do

      assert_select "input[name=?]", "order_product[quantity]"

      assert_select "input[name=?]", "order_product[order_id]"

      assert_select "input[name=?]", "order_product[product_id]"
    end
  end
end
