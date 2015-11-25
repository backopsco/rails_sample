module EncryptionHelper
  class << self
    def encrypt(value)
      encryptor.encrypt_and_sign(value)
    end

    def decrypt(value)
      encryptor.decrypt_and_verify(value)
    end

    def encryptor
      @encryptor ||= ActiveSupport::MessageEncryptor.new(Rails.application.secrets.crypt_key)
    end
  end
end
