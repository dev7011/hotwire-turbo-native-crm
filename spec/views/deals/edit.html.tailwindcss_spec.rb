require 'rails_helper'

RSpec.describe "deals/edit", type: :view do
  let(:deal) {
    Deal.create!()
  }

  before(:each) do
    assign(:deal, deal)
  end

  it "renders the edit deal form" do
    render

    assert_select "form[action=?][method=?]", deal_path(deal), "post" do
    end
  end
end
