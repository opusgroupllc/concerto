# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create([
  { 
    name: "PUBLIC",
    point_of_contact: "N/A",
    poc_email: "",
    client: "Public Sector",
    location: "Washington, DC"
   },
  {
    name: "PRIVATE",
    point_of_contact: "N/A",
    poc_email: "",
    client: "Private Sector",
    location: "Atlanta, GA"
  },
  {
    name: "INTERNAL",
    point_of_contact: "N/A",
    poc_email: "",
    client: "OPUS HR",
    location: ""
  }
])

Position.create([
  { title: "Cold Fusion Developer", description: "", level: ""},
  { title: "Java Developer", description: "", level: ""},
  { title: ".NET Developer", description: "", level: ""}
])

Position.create([
  { title: "SCRUM Master", description: "", level: ""},
  { title: "SQL Developer", description: "", level: ""},
  { title: "Project Manager", description: "", level: ""}
])

Position.create([
  { title: "DevOps Engineer", description: "", level: ""},
  { title: "Ruby on Rails Developer", description: "", level: ""}
])























