json.array!(@administrators) do |administrator|
  json.extract! administrator, :slug, :email, :password_digest, :authentication_token, :reset_password_token, :reset_password_sent_at, :sudo
  json.url administrator_url(administrator, format: :json)
end