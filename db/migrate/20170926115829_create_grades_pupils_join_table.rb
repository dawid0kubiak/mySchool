class CreateGradesPupilsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :grades, :pupils
  end
end
