class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :dialog, index: true
      t.references :author, index: true, polymorphic: true
      t.timestamps
    end
  end
end
