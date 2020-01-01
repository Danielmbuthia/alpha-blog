class User < ApplicationRecord
  has_many :articles
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX =  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :username,
            uniqueness:{case_sensitive:false },
            presence: true,
            length: {minimum: 3,maximum: 25}
  validates :email,
            uniqueness:{case_sensitive:false },
            presence: true,
            length: {maximum: 105},
            format: {with: VALID_EMAIL_REGEX }
  has_secure_password
end
