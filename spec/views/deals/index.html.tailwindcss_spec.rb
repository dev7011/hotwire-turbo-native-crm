require 'rails_helper'

RSpec.describe "deals/index", type: :view do
  before(:each) do
    assign(:deals, [
      Deal.create!(),
      Deal.create!()
    ])
  end

  it "renders a list of deals" do
    render
    cell_selector = 'div>p'
  end
end
