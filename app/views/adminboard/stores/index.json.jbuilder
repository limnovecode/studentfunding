json.array!(@stores) do |store|
  json.extract! store, :title, :description, :active
  json.url store_url(store, format: :json)
end