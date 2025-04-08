require 'rails_helper'

RSpec.describe "product_categories/show", type: :view do
  before(:each) do
    assign(:product_category, ProductCategory.create!(
      title: "Title",
      restaurante: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
