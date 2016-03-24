class ArchiveController < ApplicationController
  def index
    @articles = Article.includes(:raw_article, :press).order('published_at DESC').page(params[:page])
    @articles = @articles.where("title LIKE ?", "%#{params[:q]}%") if params[:q].present?

    filter_search(params).each do |k, v|
      @articles = @articles.public_send(k, v) if v.present?
    end
  end

  private 

  def filter_search(params)
    params.slice(:cut_day, :publisher)
  end
end
