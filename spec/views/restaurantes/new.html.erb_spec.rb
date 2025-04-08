require 'rails_helper'

RSpec.describe "restaurantes/new", type: :view do
  before(:each) do
    assign(:restaurante, Restaurante.new(
      name: "MyString",
      description: "MyText",
      delivery_tax: 1.5,
      city: "MyString",
      street: "MyString",
      neighborhood: "MyString",
      number: "MyString",
      complement: "MyString",
      category: nil
    ))
  end

  it "renders new restaurante form" do
    render

    assert_select "form[action=?][method=?]", restaurantes_path, "post" do

      assert_select "input[name=?]", "restaurante[name]"

      assert_select "textarea[name=?]", "restaurante[description]"

      assert_select "input[name=?]", "restaurante[delivery_tax]"

      assert_select "input[name=?]", "restaurante[city]"

      assert_select "input[name=?]", "restaurante[street]"

      assert_select "input[name=?]", "restaurante[neighborhood]"

      assert_select "input[name=?]", "restaurante[number]"

      assert_select "input[name=?]", "restaurante[complement]"

      assert_select "input[name=?]", "restaurante[category_id]"
    end
  end
end
