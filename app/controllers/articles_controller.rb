# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    # @articles = Article.where(status: :released).order(:released_at).page(params[:page]).per(20)
    articles = Article.where(status: :released).order('updated_at desc')
    topic_articles = TopicArticle.where(status: :released).order('updated_at desc')
    @articles = Kaminari.paginate_array((articles + topic_articles).sort_by { | article | article.updated_at }.reverse).page(params[:page]).per(20)
  end

  def show
    @article = Article.find(params[:id])
    return render_404 unless @article.released?
    @markdown = Redcarpet::Markdown.new(CustomRender, autolink: true, tables: true)
    @recommend_articles = Article.where(recommend: true).where.not(priority: 0).order(:priority).limit(5)
  end
end
