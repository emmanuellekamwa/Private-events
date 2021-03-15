class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :events, foreign_key: :creator_id

  has_many :invites, foreign_key: :invitee_id
  # has_many :attended_events, :through => :invites

  before_create :create_remember_token

  def past_events
    # find user events whose date is less than the date now
    events.where('date < ?', Date.today)
  end

  def upcoming_events
    events.where('date > ?', Date.today)
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def attending?(event)
    event.invitees.include?(self)
  end

  def attend!(event)
    invites.create!(event_id: event.id)
  end

  def cancel!(event)
    invites.find_by(event_id: event.id).destroy
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
