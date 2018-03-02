class User < ActiveRecord::Base
  has_secure_password
  has_many :groups
  has_many :memberships
  has_many :members, through: :memberships, source: :groups


  validates :first_name, :last_name,  presence: true, length: { in: 2..20 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  

  
  before_create :tolower
  def tolower
    self.email.downcase!
  end
end
