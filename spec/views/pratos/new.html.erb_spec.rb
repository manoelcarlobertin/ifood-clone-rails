require 'rails_helper'

RSpec.describe "pratos/new", type: :view do
  before(:each) do
    assign(:prato, Prato.new(
      name: "MyString",
      description: "MyText",
      price: 1.5,
      restaurante: nil
    ))
  end

  it "renders new prato form" do
    render

    assert_select "form[action=?][method=?]", pratos_path, "post" do

      assert_select "input[name=?]", "prato[name]"

      assert_select "textarea[name=?]", "prato[description]"

      assert_select "input[name=?]", "prato[price]"

      assert_select "input[name=?]", "prato[restaurante_id]"
    end
  end
end
