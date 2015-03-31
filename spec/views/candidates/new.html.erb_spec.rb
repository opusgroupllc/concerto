require 'rails_helper'

RSpec.describe "candidates/new", type: :view do
  before(:each) do
    assign(:candidate, Candidate.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :phone_number => "MyString",
      :github_url => "MyString"
    ))
  end

  it "renders new candidate form" do
    render

    assert_select "form[action=?][method=?]", candidates_path, "post" do

      assert_select "input#candidate_first_name[name=?]", "candidate[first_name]"

      assert_select "input#candidate_last_name[name=?]", "candidate[last_name]"

      assert_select "input#candidate_phone_number[name=?]", "candidate[phone_number]"

      assert_select "input#candidate_github_url[name=?]", "candidate[github_url]"
    end
  end
end
