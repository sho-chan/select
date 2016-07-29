class PhotosController < ApplicationController
	require'twitter'
	require'instagram'
	def index
		@client = Twitter::REST::Client.new do |config|
    	config.consumer_key        = '1NjdQJfDQEpKcxz9SQ9PXXzo7'
    	config.consumer_secret     = 'uuzYItNYFqG767qy455VzhIlD4wMcnzLwAL16PlQq2F2VIvcTy'
    	config.access_token        = '2400827238-xogkXd5UtO2NjgWDUxmoCn38fMsBC4a1TDHIEnG'
    	config.access_token_secret = 'bE6EkWbuHXwXeu9GJQyhedlrNPc2Wgg0UA6lTVXfYRG3S'
		end

		Instagram.configure do |config|
    	config.client_id = "	fff29320b02942aab16d99c2bc084ea5"
    	config.client_secret = "46066638107a4f13a9a9a91fd9341aaf"
    	config.access_token = "3596203590.fff2932.a3276b272d944d3d90ee7d85a9d01697"
		end

		@users = Instagram.user_recent_media("3596203590")
	end
end
