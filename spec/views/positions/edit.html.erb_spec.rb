require 'rails_helper'

RSpec.describe "positions/edit", type: :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit position form" do
    render

    assert_select "form[action=?][method=?]", position_path(@position), "post" do

      assert_select "input#position_title[name=?]", "position[title]"

      assert_select "input#position_description[name=?]", "position[description]"
    end
  end
end
