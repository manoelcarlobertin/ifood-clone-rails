require 'rails_helper'

RSpec.describe "product_categories/new", type: :view do
  before(:each) do
    assign(:product_category, ProductCategory.new(
      title: "MyString",
      restaurante: nil
    ))
  end

  it "renders new product_category form" do
    render

    assert_select "form[action=?][method=?]", product_categories_path, "post" do

      assert_select "input[name=?]", "product_category[title]"

      assert_select "input[name=?]", "product_category[restaurante_id]"
    end
  end
end
