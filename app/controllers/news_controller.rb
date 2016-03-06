class NewsController < ApplicationController	
	def index
		
		@q = "뉴스"
		@howmany = 100
		@qtype = "recent"
		#	@tweets = $twitter.search("감사", geocode: '37.527114,127.027861,100km', result_type: "mixed", lang: 'ko').take(20)
		@tweets = $twitter.search(@q, result_type: @qtype, lang: 'ko').take(@howmany)
	
	end
	
end