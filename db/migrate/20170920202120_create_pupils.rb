class CreatePupils < ActiveRecord::Migration[5.1]
  def change
    create_table :pupils do |t|
      t.string :name
      t.string :lastname
      t.text :note

      t.timestamps
    end
  end
end
