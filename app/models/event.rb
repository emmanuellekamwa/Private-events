class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :invites, foreign_key: 'event_id'
  has_many :invitees, through: :invites

  scope :upcoming, -> { where('Date >= ?', Date.today).order('Date ASC') }
  scope :past, -> { where('Date < ?', Date.today).order('Date DESC') }
end
