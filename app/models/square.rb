class Square < ApplicationRecord
  #Creates the relationship of what teachers the student belongs too
    has_many :passive_relationships, class_name:  "RosterSquare",
                                     foreign_key: "square_id",
                                     dependent:   :destroy
    has_many :students, through: :passive_relationships, source: :student
end
