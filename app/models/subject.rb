class Subject < ApplicationRecord
  has_and_belongs_to_many :pupils
  has_and_belongs_to_many :grades
  validates :name, :presence => true
end
