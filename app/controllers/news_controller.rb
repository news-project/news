class NewsController < ApplicationController	
	def index
		
	@q = "오늘"
	#	@tweets = $twitter.search("감사", geocode: '37.527114,127.027861,100km', result_type: "mixed", lang: 'ko').take(20)
	@tweets = $twitter.search(@q, result_type: "recent", lang: 'ko').take(100)
	
	end
	
end