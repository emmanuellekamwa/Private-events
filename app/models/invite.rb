class Invite < ApplicationRecord
    belongs_to :attendee, class_name: "User"
    belongs_to :attended_event, class_name: "Event"
    belongs_to :attendee_id, class_name: "User"
  
    validates :attendee_id, presence: true
    validates :attended_event_id, presence: true
end
