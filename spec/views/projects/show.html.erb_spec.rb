require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "Name",
      :point_of_contact => "Point Of Contact",
      :poc_email => "Poc Email",
      :client => "Client",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Point Of Contact/)
    expect(rendered).to match(/Poc Email/)
    expect(rendered).to match(/Client/)
    expect(rendered).to match(/Location/)
  end
end
