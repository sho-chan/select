class MainController < ApplicationController
  require'twitter'

  def index
    @abouts = About.all

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = '1NjdQJfDQEpKcxz9SQ9PXXzo7'
      config.consumer_secret     = 'uuzYItNYFqG767qy455VzhIlD4wMcnzLwAL16PlQq2F2VIvcTy'
      config.access_token        = '2400827238-xogkXd5UtO2NjgWDUxmoCn38fMsBC4a1TDHIEnG'
      config.access_token_secret = 'bE6EkWbuHXwXeu9GJQyhedlrNPc2Wgg0UA6lTVXfYRG3S'
    end

    # Google API 現在時以降の予定を出力：関数はApplicationController内に記述
    @events = google_api('o0av2oqs27gsg0o5s00g14l2go@group.calendar.google.com')
    @matches = google_api('t9eteqvebudg1fd4l1htkalvog@group.calendar.google.com')
    @practices = google_api('aos9u8bjbpjc7uj6onnogkgfi8@group.calendar.google.com')

  end
end
