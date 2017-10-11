class Pupil < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :pupils_grades
  validates :name, presence: true
  validates :lastname, presence: true


  def grades(subject)
    # pupils_grades.where(subject_id: subject).map(&:grade)
    pupils_grades.where(subject_id: subject).map do |grade|
      grade.grade.created_at = grade.created_at
      grade.grade.updated_at = grade.updated_at
      grade.grade
    end
  end
end
