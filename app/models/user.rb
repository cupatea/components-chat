class User < ApplicationRecord
  has_secure_password
  has_many :dialogs, dependent: :destroy
  has_many :messages, dependent: :destroy, as: :author

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
