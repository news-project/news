class NewsController < ApplicationController
	def index
		@name = $twitter.user('boramamohani')
	end
	
end