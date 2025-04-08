require 'rails_helper'

RSpec.describe "order_products/show", type: :view do
  before(:each) do
    assign(:order_product, OrderProduct.create!(
      quantity: 2,
      order: nil,
      product: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
