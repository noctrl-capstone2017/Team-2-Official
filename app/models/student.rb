class Student < ApplicationRecord
    validates :student_name, presence: true
    validates :student_icon_name, presence: true, uniqueness: true
    validates :student_description, presence: true
    validates :color, presence: true
    validates :student_icon, presence: true
    
   #Creates the relationship of what teachers the student belongs too
    has_many :passive_relationships, class_name:  "RosterStudent",
                                     foreign_key: "student_id",
                                     dependent:   :destroy
    has_many :teachers, through: :passive_relationships, source: :teacher
    
    #Creates the relationship of what behaviors are tracked for the student
    has_many :active_relationships, class_name:  "RosterSquare",
                                     foreign_key: "student_id",
                                     dependent:   :destroy
    has_many :squares, through: :active_relationships, source: :square
end