class ArchiveController < ApplicationController
  def index
    @articles = Article.all.includes(:raw_article, :press)
        
    @articles = @articles.where("title LIKE ?", "%#{params[:q]}%") if params[:q].present?
       
    filter_search(params).each do |k, v|
      @articles = @articles.public_send(k, v) if v.present?
    end

    @articles = @articles.order('published_at DESC').page(params[:page])
  end

  private 

  def filter_search(params)
    params.slice(:cut_day, :publisher)
  end
end
