class Student < ApplicationRecord
    #Ensures values can't be empty except for desc. icon name must be unique.
    validates :student_name, presence: true
    validates :student_icon_name, presence: true, uniqueness: true
    validates :student_contact_info, presence: true
    validates :color, presence: true
    validates :student_icon, presence: true
end
