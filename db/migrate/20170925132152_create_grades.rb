class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :short_name
      t.string :long_name
      t.string :value


      t.timestamps
    end
  end
end
