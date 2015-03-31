json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :first_name, :last_name, :phone_number, :github_url
  json.url candidate_url(candidate, format: :json)
end
