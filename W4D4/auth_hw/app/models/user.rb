class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token #before_validation :ensure_session_token
  
  attr_reader :password
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(input_username, password)
    user = User.find_by(username: input_username)
    return nil if user.nil?
    return user if user.is_password?(password)
    nil
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    @session_token = self.class.generate_session_token
    save!
    @session_token
  end
  
  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
