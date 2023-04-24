require 'openssl'
class Cipher
  def initialize
    @cipher = OpenSSL::Cipher::AES256.new
    @cipher.iv = ENV['cipher_vector']
    @cipher.key = ENV['cipher_key']
  end

  def encrypt(text)
    @cipher.encrypt
    @cipher.update(text) + @cipher.final
  end

  def decrypt(text)
    @cipher.decrypt
    @cipher.update(text) + @cipher.final
  end
end