class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.boolean :readed
      t.boolean :deleted

      t.timestamps
    end
  end
end
