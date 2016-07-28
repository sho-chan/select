class HomesController < ApplicationController
	require'twitter'
	def index
		@client = Twitter::REST::Client.new do |config|
    	config.consumer_key        = '1NjdQJfDQEpKcxz9SQ9PXXzo7'
    	config.consumer_secret     = 'uuzYItNYFqG767qy455VzhIlD4wMcnzLwAL16PlQq2F2VIvcTy'
    	config.access_token        = '2400827238-xogkXd5UtO2NjgWDUxmoCn38fMsBC4a1TDHIEnG'
    	config.access_token_secret = 'bE6EkWbuHXwXeu9GJQyhedlrNPc2Wgg0UA6lTVXfYRG3S'
		end
	end
end
