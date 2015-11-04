json.array!(@schools) do |school|
  json.extract! school, :title, :description, :active
  json.url school_url(school, format: :json)
end