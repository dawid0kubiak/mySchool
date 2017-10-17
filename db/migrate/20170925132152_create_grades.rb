class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :short_name, unique: true, null: false
      t.string :long_name
      t.float :value, null: false

      t.timestamps
    end
  end
end
