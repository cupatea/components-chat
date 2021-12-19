class Message < ApplicationRecord
  belongs_to :dialog
  belongs_to :author, polymorphic: true
end
