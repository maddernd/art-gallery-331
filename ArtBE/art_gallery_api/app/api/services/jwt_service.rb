class JwtService
    HMAC_SECRET = Rails.application.secret_key_base
    EXPIRATION_TIME = 24.hours.to_i
  
    def self.encode(payload)
      payload[:exp] = EXPIRATION_TIME.from_now.to_i
      JWT.encode(payload, HMAC_SECRET)
    end
  
    def self.decode(token)
      payload = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new payload
    rescue JWT::ExpiredSignature, JWT::VerificationError => e
      raise Errors::Unauthorized, e.message
    end
  end
  