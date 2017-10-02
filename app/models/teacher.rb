class Teacher < ApplicationRecord
  has_and_belongs_to_many :subjects

  def name_displayed
    self.name + ' ' + self.lastname
  end
end
