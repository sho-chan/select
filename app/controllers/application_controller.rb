class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # twitter api
  require'twitter'

  # Google api
  require 'google/apis/calendar_v3'
  require 'googleauth'
  require 'googleauth/stores/file_token_store'
  require 'fileutils'

  def google_api(calendar_id)
    oob_url = 'urn:ietf:wg:oauth:2.0:oob'
    application_name = 'Google Calendar API Ruby Quickstart'
    client_screts_path = 'client_secret.json'
    credentials_path = File.join(Dir.home, '.credentials', "calendar-ruby-quickstart.yaml")
    scope = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

    ##
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or intitiating an OAuth2 authorization. If authorization is required,
    # the user's default browser will be launched to approve the request.
    #
    # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
    FileUtils.mkdir_p(File.dirname(credentials_path))

    client_id = Google::Auth::ClientId.from_file(client_screts_path)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: credentials_path)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, scope, token_store)
    user_id = 'handballhosei'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: oob_url)
      # puts "Open the following URL in the browser and enter the " + "resulting code after authorization"
      # puts url
      code = '4/Wmo5c1wTcSVK5u5joi4zVf9l5HYu_OBAZS_6XSTByX8'
      credentials = authorizer.get_and_store_credentials_from_code(user_id: user_id, code: code, base_url: oob_url)
    end

    # Initialize the API
    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = application_name
    service.authorization = credentials

    # Fetch the next 10 events for the user
    response = service.list_events(calendar_id, max_results: 10, single_events: true, order_by: 'startTime', time_min: Time.now.iso8601).items
  end

end
