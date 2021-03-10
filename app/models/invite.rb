class Invite < ApplicationRecord
  belongs_to :invitee, class_name: 'User'
  belongs_to :event, class_name: 'Event'

  validates :event_id, presence: true
  validates :invitee_id, presence: true
end
