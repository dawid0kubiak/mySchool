class Teacher < ApplicationRecord
  attr_readonly :name_displayed
  has_and_belongs_to_many :subjects

  def name_displayed
    "#{name} #{lastname}"
  end
end
