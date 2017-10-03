class Pupil < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :pupils_grades
  validates :name, :presence => true
  validates :lastname, :presence => true

  def grades(subject)
    self.pupils_grades.where(subject_id: subject).map {|grade| grade.grade}
  end
end
