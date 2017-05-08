class Square < ApplicationRecord
  #Make sure none empty or any square id is not unique
  validates :square_id, presence: true, uniqueness: true
  validates :square_type, presence: true
  validates :color, presence: true
  validates :square_description, presence: true
  #Creates the relationship of what teachers the student belongs too
    has_many :passive_relationships, class_name:  "RosterSquare",
                                     foreign_key: "square_id",
                                     dependent:   :destroy
    has_many :students, through: :passive_relationships, source: :student
end
