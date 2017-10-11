class User < ApplicationRecord
  has_many :subjects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = {
      admin: :admin,
      teacher: :nauczyciel,
      parent: :rodzic,
      new: :nowy
  }

  def name_displayed
    "#{name} #{lastname}"
  end
  def has_role?(role)
    self.role == role.to_s
  end
end
