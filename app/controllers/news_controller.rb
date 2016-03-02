class NewsController < ApplicationController	
	def index
		
	#	@tweets = $twitter.search("감사", geocode: '37.527114,127.027861,100km', result_type: "mixed", lang: 'ko').take(20)
		@tweets = $twitter.search("감사", result_type: "popular", lang: 'ko').take(20)
	
	end
	
end