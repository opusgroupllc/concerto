require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone_number => "Phone Number",
        :github_url => "Github Url"
      ),
      Candidate.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :phone_number => "Phone Number",
        :github_url => "Github Url"
      )
    ])
  end

  it "renders a list of candidates" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Github Url".to_s, :count => 2
  end
end
