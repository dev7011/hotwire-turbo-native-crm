require 'rails_helper'

RSpec.describe "deals/show", type: :view do
  before(:each) do
    assign(:deal, Deal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
