class CreateAbsenceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :absence_types do |t|
      t.string :short_name
      t.string :long_name

      t.timestamps
    end
  end
end
