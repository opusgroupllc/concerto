require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :name => "Name",
        :point_of_contact => "Point Of Contact",
        :poc_email => "Poc Email",
        :client => "Client",
        :location => "Location"
      ),
      Project.create!(
        :name => "Name",
        :point_of_contact => "Point Of Contact",
        :poc_email => "Poc Email",
        :client => "Client",
        :location => "Location"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Point Of Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Email".to_s, :count => 2
    assert_select "tr>td", :text => "Client".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
