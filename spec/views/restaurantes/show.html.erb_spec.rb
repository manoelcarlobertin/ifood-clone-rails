require 'rails_helper'

RSpec.describe "restaurantes/show", type: :view do
  before(:each) do
    assign(:restaurante, Restaurante.create!(
      name: "Name",
      description: "MyText",
      delivery_tax: 2.5,
      city: "City",
      street: "Street",
      neighborhood: "Neighborhood",
      number: "Number",
      complement: "Complement",
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Neighborhood/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Complement/)
    expect(rendered).to match(//)
  end
end
