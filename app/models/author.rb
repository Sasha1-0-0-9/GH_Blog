class Author < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  has_many :posts
  has_many :comments

  def full_name
    "#{first_name} #{last_name} "
  end
end
