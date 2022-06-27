# frozen_string_literal: true

class Topics::T8Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 8).where(status: 'released')
  end
end
