require 'rails_helper'

RSpec.describe "stages/new", type: :view do
  before(:each) do
    assign(:stage, Stage.new(
      :name => "MyString"
    ))
  end

  it "renders new stage form" do
    render

    assert_select "form[action=?][method=?]", stages_path, "post" do

      assert_select "input#stage_name[name=?]", "stage[name]"
    end
  end
end
