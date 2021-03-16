module EventsHelper
  def host?(user)
    current_user == user
  end

  def show_button
    if @event.date < Date.today
      'empty'
    else
      current_user.attending?(@event) ? 'cancel' : 'attend'
    end
  end

  def attend_button
    signed_in? ? 'attend_form' : 'empty'
  end
end
