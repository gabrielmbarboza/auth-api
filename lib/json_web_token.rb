require 'jwt'

class JsonWebToken
  SECRET = ENV['JWT_SECRET']

  def self.encode(payload, exp: Time.now.to_i + 60)
    raise StandardError.new("The payload must be a hash") unless payload.is_a?(Hash)
    
    payload.merge!({ exp: exp })
    
    JWT.encode(payload, SECRET, "HS256")
  end

  def self.decode(token)
    JWT.decode(token, SECRET, true, { algorithm: "HS256" })
  rescue
    []
  end
end