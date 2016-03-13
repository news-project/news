class ArchiveController < ApplicationController
  def index
    @articles = Article.includes(:raw_article, :press).order('published_at DESC').page(params[:page])
    @articles = @articles.where("title LIKE ?", "%#{params[:q]}%") if params[:q].present?
  end
end
