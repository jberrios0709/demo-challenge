class User < ApplicationRecord
  has_secure_password

  has_many :csv_files
  has_many :contacts

  validates :username, presence: true, uniqueness: { case_sensitive: false }, email: true
end
