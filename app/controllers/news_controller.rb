class NewsController < ApplicationController
	def collect_with_max_id(collection=[], max_id=nil, &block)
		response = yield(max_id)
		collection += response
		response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
	end
	
	def $twitter.get_all_tweets(user)
		options = {count: 200, include_rts: true}
		#options[:max_id] = max_id unless max_id.nil?
		user_timeline(user, options)
	end
	
	def index
		@name = $twitter.user('boramamohani')
		@tweets = $twitter.get_all_tweets('boramamohani')

		@array = Array.new
		$twitter.search("to:justinbieber marry me", result_type: "recent").take(3).each do |tweet|
			@array << tweet.text 
		end
	end
	
end