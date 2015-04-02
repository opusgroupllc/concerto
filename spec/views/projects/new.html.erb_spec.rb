require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :name => "MyString",
      :point_of_contact => "MyString",
      :poc_email => "MyString",
      :client => "MyString",
      :location => "MyString"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_point_of_contact[name=?]", "project[point_of_contact]"

      assert_select "input#project_poc_email[name=?]", "project[poc_email]"

      assert_select "input#project_client[name=?]", "project[client]"

      assert_select "input#project_location[name=?]", "project[location]"
    end
  end
end
