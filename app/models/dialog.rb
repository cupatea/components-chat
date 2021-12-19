class Dialog < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  has_many :messages, dependent: :destroy

  validates :profile_id, uniqueness: { scope: :user_id }
end
