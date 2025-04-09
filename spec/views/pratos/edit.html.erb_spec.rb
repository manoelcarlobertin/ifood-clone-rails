require 'rails_helper'

RSpec.describe "pratos/edit", type: :view do
  let(:prato) {
    Prato.create!(
      name: "MyString",
      description: "MyText",
      price: 1.5,
      restaurante: nil
    )
  }

  before(:each) do
    assign(:prato, prato)
  end

  it "renders the edit prato form" do
    render

    assert_select "form[action=?][method=?]", prato_path(prato), "post" do

      assert_select "input[name=?]", "prato[name]"

      assert_select "textarea[name=?]", "prato[description]"

      assert_select "input[name=?]", "prato[price]"

      assert_select "input[name=?]", "prato[restaurante_id]"
    end
  end
end
