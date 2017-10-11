class CreateMessage < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :message_id
    end
  end
end
