class User < ApplicationRecord
  has_many :subjects
  has_many :messages, class_name: 'Message', foreign_key: 'recipient_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = {
    admin: :admin,
    teacher: :nauczyciel,
    parent: :rodzic,
    new: :nowy
  }.freeze

  def name
    "#{firstname} #{lastname}"
  end

  def find_messages
    Message.where("sender_id = ? OR recipient_id = ?", id, id)
  end

  def has_role?(role)
    role = Array(role) if role.class != Array
    role.map!(&:to_sym)
    role.include?(self.role.to_sym)
  end
end
