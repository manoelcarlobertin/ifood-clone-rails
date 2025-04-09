require 'rails_helper'

RSpec.describe "pratos/show", type: :view do
  before(:each) do
    assign(:prato, Prato.create!(
      name: "Name",
      description: "MyText",
      price: 2.5,
      restaurante: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
  end
end
