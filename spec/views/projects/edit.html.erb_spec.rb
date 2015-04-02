require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "MyString",
      :point_of_contact => "MyString",
      :poc_email => "MyString",
      :client => "MyString",
      :location => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_point_of_contact[name=?]", "project[point_of_contact]"

      assert_select "input#project_poc_email[name=?]", "project[poc_email]"

      assert_select "input#project_client[name=?]", "project[client]"

      assert_select "input#project_location[name=?]", "project[location]"
    end
  end
end
