require 'rails_helper'

RSpec.describe "stages/show", type: :view do
  before(:each) do
    @stage = assign(:stage, Stage.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
