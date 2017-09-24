class Pupil < ApplicationRecord
  has_and_belongs_to_many :subjects
  validates :name, :presence => true
  validates :lastname, :presence => true
end
