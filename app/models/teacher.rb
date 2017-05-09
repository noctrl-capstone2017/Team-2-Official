# author: Kevin M
# Teacher model, validates the presence of various properties, but nothing else
#  right now.
class Teacher < ApplicationRecord

  attr_accessor :remember_token, :activation_token, :reset_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :user_name,  presence: true, length: { maximum: 75 }
  validates :teacher_icon_name,  presence: true, length: { maximum: 15 }
  validates :teacher_name, presence: true, length: { maximum: 75 }
  validates :teacher_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :color, presence: true

  validates :password_digest, presence: true, length: {minimum: 6 }

  # Steven Royster: Added has_secure_password, remmeber function, authenticated? function, and the BCrypt functionality
  has_secure_password

  validates :school_id, presence: true
  validates :teacher_description, presence: true
  validates :teacher_password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :teacher_password_confirmation, presence: true, length: { minimum: 6 }, allow_nil: true


  #Creates the relationship of what students belong to the teacher
  #author Matthew OBzera + Alexander Pavia
  has_many :active_relationships, class_name:  "RosterStudent",
                                  foreign_key: "teacher_id",
                                  dependent:   :destroy

 has_many :students, through: :active_relationships, source: :student
 
  # Returns a random token.
  def Teacher.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = Teacher.new_token
    update_attribute(:remember_digest, Teacher.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns the hash digest of the given string.
  def Teacher.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
end
