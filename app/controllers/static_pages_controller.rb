class StaticPagesController < ApplicationController
  def home
    return unless signed_in?

    @user = current_user
    @previous_events = @user.past_events
    @upcoming_events = @user.upcoming_events
  end
end

def about; end
