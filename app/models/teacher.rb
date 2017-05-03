# author: Kevin M
# Teacher model, validates the presence of various properties, but nothing else
#  right now.
class Teacher < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :user_name, presence: true
  validates :teacher_icon_name, presence: true, length: { maximum: 8 }
  validates :teacher_name, presence: true, length: { maximum: 8 }
  validates :teacher_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :color, presence: true
  validates :school_id, presence: true
end
