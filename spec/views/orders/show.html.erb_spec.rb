require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    assign(:order, Order.create!(
      name: "Name",
      mobile_phone: "Mobile Phone",
      total_value: 2.5,
      city: "City",
      neighborhood: "Neighborhood",
      number: "Number",
      complement: "Complement",
      status: 3,
      restaurante: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mobile Phone/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Neighborhood/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Complement/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
