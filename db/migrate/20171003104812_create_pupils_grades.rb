class CreatePupilsGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :pupils_grades do |t|
      t.integer :grade_id
      t.integer :pupil_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
