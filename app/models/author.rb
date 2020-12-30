class Author < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  has_many :posts
  has_many :comments
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  # PASSWORD_FORMAT = /\A(?=\\S+$)(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze
  # validates :password_digest, presence: true, format: { with: VALID_EMAIL_REGEX }, unless: :persisted?
  validates :email, presence: true, length: { minimum: 5, maximum: 50 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def full_name
    "#{first_name} #{last_name} "
  end
end
