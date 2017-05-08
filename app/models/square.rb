class Square < ApplicationRecord
  #Make sure none empty or any square id is not unique
  validates :square_id, presence: true, uniqueness: true
  validates :square_type, presence: true
  validates :color, presence: true
  validates :square_description, presence: true
end
