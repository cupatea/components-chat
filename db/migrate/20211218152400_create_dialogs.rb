class CreateDialogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dialogs do |t|
      t.references :user, index: true
      t.references :profile, index: true
      t.timestamps
    end

    add_index :dialogs, %i[user_id profile_id], unique: true
  end
end
