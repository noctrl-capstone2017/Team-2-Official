# author: Kevin M
# Teacher model, validates the presence of various properties, but nothing else
#  right now.
class Teacher < ApplicationRecord

  validates :user_name,  presence: true, length: { maximum: 75 }
  validates :teacher_icon_name,  presence: true, length: { maximum: 15 }
  validates :teacher_name, presence: true, length: { maximum: 75 }
  validates :teacher_email, presence: true, length: { maximum: 255 }
  validates :teacher_description, presence: true
  validates :color, presence: true
  validates :teacher_password, presence: true, length: { minimum: 6 }, allow_nil: true
  # the password confirmation is not implemented
  #validates :teacher_password_confirmation, presence: true, length: { minimum: 6 }, allow_nil: true


 #Creates the relationship of what students belong to the teacher
  #author Alexander Pavia
  has_many :active_relationships, class_name:  "RosterStudent",
                                  foreign_key: "teacher_id",
                                  dependent:   :destroy

 has_many :students, through: :active_relationships, source: :student
end
