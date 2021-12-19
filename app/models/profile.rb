class Profile < ApplicationRecord
  has_many :dialogs, dependent: :destroy
  has_many :messages, dependent: :destroy, as: :author

  validates :name, presence: true

  scope :for_new_user_dialog, ->(user) { left_joins(:dialog).where.not(dialogs: { id: user.dialogs.select(:id) }) }
end
