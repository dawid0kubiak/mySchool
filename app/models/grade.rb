class Grade < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :pupils
end
