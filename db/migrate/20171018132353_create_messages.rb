class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.boolean :unread, default: true
      t.boolean :deleted, default: false
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
