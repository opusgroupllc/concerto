require 'rails_helper'

RSpec.describe "positions/index", type: :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        :title => "Title",
        :description => "Description"
      ),
      Position.create!(
        :title => "Title",
        :description => "Description"
      )
    ])
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
