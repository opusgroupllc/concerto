require 'rails_helper'

RSpec.describe "stages/index", type: :view do
  before(:each) do
    assign(:stages, [
      Stage.create!(
        :name => "Name"
      ),
      Stage.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of stages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
