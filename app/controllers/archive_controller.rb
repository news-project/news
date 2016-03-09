class ArchiveController < ApplicationController
  def index
    @articles = Article.all
  end

end
