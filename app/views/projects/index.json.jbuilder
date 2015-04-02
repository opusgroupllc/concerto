json.array!(@projects) do |project|
  json.extract! project, :id, :name, :point_of_contact, :poc_email, :client, :location
  json.url project_url(project, format: :json)
end
