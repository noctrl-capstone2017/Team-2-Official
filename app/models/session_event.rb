class SessionEvent < ApplicationRecord
    belongs_to :session
    validates :session_id, presence: true
end

