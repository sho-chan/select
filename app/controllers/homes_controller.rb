class HomesController < ApplicationController
	def index
		@client = Twitter::REST::Client.new do |config|
    	config.consumer_key        = '1NjdQJfDQEpKcxz9SQ9PXXzo7'
    	config.consumer_secret     = 'uuzYItNYFqG767qy455VzhIlD4wMcnzLwAL16PlQq2F2VIvcTy'
    	config.access_token        = '2400827238-xogkXd5UtO2NjgWDUxmoCn38fMsBC4a1TDHIEnG'
    	config.access_token_secret = 'bE6EkWbuHXwXeu9GJQyhedlrNPc2Wgg0UA6lTVXfYRG3S'
		end
    # Initialize the client & Google+ API
    require 'google/api_client'
    require "yaml"
    require "time"

    # Initialize OAuth 2.0 client
    # authorization
    oauth_yaml = YAML.load_file('.google-api.yaml')
    client = Google::APIClient.new(:application_name => '')
    client.authorization.client_id = oauth_yaml["client_id"]
    client.authorization.client_secret = oauth_yaml["client_secret"]
    client.authorization.scope = oauth_yaml["scope"]
    client.authorization.refresh_token = oauth_yaml["refresh_token"]
    client.authorization.access_token = oauth_yaml["access_token"]

    cal = client.discovered_api('calendar', 'v3')

    # イベント取得月の確認
    printf("カレンダーを表示する年(20XX)：")
    # year = gets.strip.to_i
    printf("カレンダーを表示する月(1-12)：")
    # month = gets.strip.to_i

    year = 2016
    month = 5

    # 時間を格納
    time_min = Time.utc(year, month, 1, 0).iso8601
    time_max = Time.utc(year, month, 31, 0).iso8601

    # イベントの取得
    params = {'calendarId' => 'primary',
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

    @events = events

    # 出力
    events.each do |event|
        printf("%s,%s\n",event.start.date,event.summary)
    end
  end
end
