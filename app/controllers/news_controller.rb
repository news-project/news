class NewsController < ApplicationController	
	def index
		#@tweets = $twitter.get_all_tweets('boramamohani')
		@tweets = $twitter.search("감사", geocode: '37.527114,127.027861,100km', result_type: "mixed", lang: 'ko').take(20)
	end
	
end