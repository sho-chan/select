class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # twitter api
  require'twitter'

  # google calendar api
  require 'google/apis/calendar_v3'
  require "yaml"
  require "time"

  def google_calendar_event_dates(year, month)
    oauth_yaml = YAML.load_file('.google-api.yaml')
    client = Google::APIClient.new(:application_name => '')
    client.authorization.client_id = oauth_yaml["client_id"]
    client.authorization.client_secret = oauth_yaml["client_secret"]
    client.authorization.scope = oauth_yaml["scope"]
    client.authorization.refresh_token = oauth_yaml["refresh_token"]
    client.authorization.access_token = oauth_yaml["access_token"]
    cal = client.discovered_api('calendar', 'v3')
    # 時間を格納
    time_min = Time.utc(year, month, 1, 0).iso8601
    time_max = Time.utc(year, month, 31, 24).iso8601
    # イベントの取得
    params = {'calendarId' => 'o0av2oqs27gsg0o5s00g14l2go@group.calendar.google.com',
              'orderBy' => 'startTime',
              'timeMax' => time_max,
              'timeMin' => time_min,
              'singleEvents' => 'True'}
    result = client.execute(:api_method => cal.events.list,
                            :parameters => params)
    # イベントの格納
    events = []
    result.data.items.each do |item|
            events << item
    end
    return events
  end

  def google_calendar_match_dates(year, month)
    oauth_yaml = YAML.load_file('.google-api.yaml')
    client = Google::APIClient.new(:application_name => '')
    client.authorization.client_id = oauth_yaml["client_id"]
    client.authorization.client_secret = oauth_yaml["client_secret"]
    client.authorization.scope = oauth_yaml["scope"]
    client.authorization.refresh_token = oauth_yaml["refresh_token"]
    client.authorization.access_token = oauth_yaml["access_token"]
    cal = client.discovered_api('calendar', 'v3')
    time_min = Time.utc(year, month, 1, 0).iso8601
    time_max = Time.utc(year, month, 31, 24).iso8601
    params = {'calendarId' => 't9eteqvebudg1fd4l1htkalvog@group.calendar.google.com',
              'orderBy' => 'startTime',
              'timeMax' => time_max,
              'timeMin' => time_min,
              'singleEvents' => 'True'}
    result = client.execute(:api_method => cal.events.list,
                            :parameters => params)
    events = []
    result.data.items.each do |item|
            events << item
    end
    return events
  end

  def google_calendar_practice_dates(year, month)
    oauth_yaml = YAML.load_file('.google-api.yaml')
    client = Google::APIClient.new(:application_name => '')
    client.authorization.client_id = oauth_yaml["client_id"]
    client.authorization.client_secret = oauth_yaml["client_secret"]
    client.authorization.scope = oauth_yaml["scope"]
    client.authorization.refresh_token = oauth_yaml["refresh_token"]
    client.authorization.access_token = oauth_yaml["access_token"]
    cal = client.discovered_api('calendar', 'v3')
    time_min = Time.utc(year, month, 1, 0).iso8601
    time_max = Time.utc(year, month, 31, 24).iso8601
    params = {'calendarId' => 'aos9u8bjbpjc7uj6onnogkgfi8@group.calendar.google.com',
              'orderBy' => 'startTime',
              'timeMax' => time_max,
              'timeMin' => time_min,
              'singleEvents' => 'True'}
    result = client.execute(:api_method => cal.events.list,
                            :parameters => params)
    events = []
    result.data.items.each do |item|
            events << item
    end
    return events
  end

end
