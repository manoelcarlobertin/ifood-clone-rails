require 'rails_helper'

RSpec.describe "product_categories/index", type: :view do
  before(:each) do
    assign(:product_categories, [
      ProductCategory.create!(
        title: "Title",
        restaurante: nil
      ),
      ProductCategory.create!(
        title: "Title",
        restaurante: nil
      )
    ])
  end

  it "renders a list of product_categories" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
