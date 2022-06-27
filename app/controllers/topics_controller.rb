# frozen_string_literal: true

class TopicsController < ApplicationController
  def show
    @article = TopicArticle.where(topic_id: params[:t_id][-1]).where(id: params[:id]).first
    return render_404 unless @article && @article.released?
    @markdown = Redcarpet::Markdown.new(CustomRender, autolink: true, tables: true)
    @recommend_articles = Article.where(recommend: true).where.not(priority: 0).order(:priority).limit(5)
  end
end
