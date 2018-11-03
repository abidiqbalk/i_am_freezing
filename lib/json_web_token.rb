require 'jwt'
class JsonWebToken
  # Encodes and signs JWT Payload
  def self.encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base,'HS512')
  end

  # Decodes the JWT with the signed secret
  def self.decode(token)
    JWT.decode(token, Rails.application.credentials.secret_key_base, true, { :algorithm => 'HS512' })
  end


end