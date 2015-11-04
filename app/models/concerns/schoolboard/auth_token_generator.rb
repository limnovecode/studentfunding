# model/concerns/schoolboard/auth_token_generator.rb

module Schoolboard::AuthTokenGenerator
  extend ActiveSupport::Concern

  # Auth Token Generator
  def generate_auth_token
    loop do
      self.authentication_token = Digest::SHA2.hexdigest("#{Time.now}").first(32)
      break unless School.exists?(authentication_token: authentication_token)
    end
  end
end
