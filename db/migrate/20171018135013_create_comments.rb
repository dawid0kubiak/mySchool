class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :message
      t.boolean :unread, default: true

      t.timestamps
    end
  end
end
