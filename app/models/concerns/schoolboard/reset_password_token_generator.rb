# model/concerns/schoolboard/reset_password_token_generator.rb

module Schoolboard::ResetPasswordTokenGenerator
  extend ActiveSupport::Concern

  # Reset Password Token Generator
  def generate_reset_password_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless School.exists?(reset_password_token: self[column])
    end
  end
end
