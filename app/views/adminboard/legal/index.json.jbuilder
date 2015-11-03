json.array!(@legal) do |legal|
  json.extract! legal, :title, :active
  json.url legal_url(legal, format: :json)
end
