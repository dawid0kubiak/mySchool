class Pupil < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :pupils_grades
  validates :name, presence: true
  validates :lastname, presence: true


  def pupil_grades(subject)
    # pupils_grades.where(subject_id: subject).map(&:grade)
    pupils_grades.where(subject_id: subject).map do |pupil_grades|
      pupil_grades.grade.created_at = pupil_grades.created_at
      pupil_grades.grade.updated_at = pupil_grades.updated_at
      pupil_grades
    end
  end
end
