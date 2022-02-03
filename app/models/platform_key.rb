class PlatformKey < ApplicationRecord
  belongs_to :platform

  def keys
    jwk = JWT::JWK.new(OpenSSL::PKey::RSA.new(self.platform.public_key))
    [jwk.export]
  end

end
