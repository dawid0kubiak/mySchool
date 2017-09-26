class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
