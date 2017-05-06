class SessionEvent < ApplicationRecord
    belongs_to :session
    has_many :teacher
    validates :session_id, presence: true
end