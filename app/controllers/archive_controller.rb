class ArchiveController < ApplicationController
  def index
    #get infinite scrolling working
    #add some styling - make viewable which publication it is from
    #maybe do some data formating
    #just show first 100 charcaters

    @articles = Article.paginate(page: params[:page], per_page: 20).order('published_at DESC')

    respond_to do |format|
    	format.html
    	format.js
    end

  end

end
