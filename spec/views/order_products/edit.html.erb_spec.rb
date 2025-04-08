require 'rails_helper'

RSpec.describe "order_products/edit", type: :view do
  let(:order_product) {
    OrderProduct.create!(
      quantity: 1,
      order: nil,
      product: nil
    )
  }

  before(:each) do
    assign(:order_product, order_product)
  end

  it "renders the edit order_product form" do
    render

    assert_select "form[action=?][method=?]", order_product_path(order_product), "post" do

      assert_select "input[name=?]", "order_product[quantity]"

      assert_select "input[name=?]", "order_product[order_id]"

      assert_select "input[name=?]", "order_product[product_id]"
    end
  end
end
