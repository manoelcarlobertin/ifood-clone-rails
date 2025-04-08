require 'rails_helper'

RSpec.describe "restaurantes/edit", type: :view do
  let(:restaurante) {
    Restaurante.create!(
      name: "MyString",
      description: "MyText",
      delivery_tax: 1.5,
      city: "MyString",
      street: "MyString",
      neighborhood: "MyString",
      number: "MyString",
      complement: "MyString",
      category: nil
    )
  }

  before(:each) do
    assign(:restaurante, restaurante)
  end

  it "renders the edit restaurante form" do
    render

    assert_select "form[action=?][method=?]", restaurante_path(restaurante), "post" do

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
