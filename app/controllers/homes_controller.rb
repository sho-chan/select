class HomesController < ApplicationController
  def index
    @events = google_calendar_event_dates(2016, 4)
    @matches = google_calendar_match_dates(2016, 4)
    @practices = google_calendar_practice_dates(2016, 4)
  end
end
