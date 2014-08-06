class User < ActiveRecord::Base
  has_many(
    :memberships,
    class_name: "CircleMembership",
    foreign_key: :member_id,
    primary_key: :id,
    inverse_of: :member
  )

  has_many(
    :belong_to_circles,
    through: :memberships,
    source: :circle
  )

  has_many(
    :owned_circles,
    class_name: "Circle",
    foreign_key: :owner_id,
    primary_key: :id,
    inverse_of: :owner
  )

  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :author_id,
    primary_key: :id,
    inverse_of: :author
  )

  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return if user.nil?
    user.is_password?(password) ? user : nil
  end

  after_initialize :ensure_session_token
  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

end
