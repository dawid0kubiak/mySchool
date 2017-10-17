class Grade < ApplicationRecord
  # has_and_belongs_to_many :subjects
  # has_and_belongs_to_many :pupils
  has_many :pupils_grades
  validates :short_name, presence: true, uniqueness: true
  validates :value, presence: true
end
