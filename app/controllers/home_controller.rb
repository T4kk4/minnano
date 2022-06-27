# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @recommend_articles = Article.where(recommend: true).where.not(priority: 0).order(:priority).limit(5)
    articles = Article.where(status: :released).order('updated_at desc').limit(5)
    topic_articles = TopicArticle.where(status: :released).order('updated_at desc').limit(5)
    @new_articles = (articles + topic_articles).sort_by { | article | article.created_at }.reverse.slice(0, 5)
    @prefectures =  City.all.group_by {|city| city.prefecture}
    respond_to do |format|
      format.html
      format.json
    end
  end
end
