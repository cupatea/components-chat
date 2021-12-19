FactoryBot.define do
  factory :message do
    dialog
    author { create(%i[user profile].sample) }
  end
end
