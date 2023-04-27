class JwtService
  HMAC_SECRET = "7585b4a551d00a22cd74b6ff1231ffc9765799529855d636664aabe971dbc7fc14a3c69c3139a562979c3293f0ea2b92f4889b8d79708c5c46acf934a0e2ebee"
  EXPIRATION_TIME = 24.hours

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