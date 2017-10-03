class PupilsGrade < ApplicationRecord
  belongs_to :grade
  belongs_to :pupil
  belongs_to :subject

end
