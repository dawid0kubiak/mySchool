class CreateGradesSubjectJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :grades, :subjects
  end
end
