class CreatePupilsSubjectsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :pupils, :subjects
  end
end
