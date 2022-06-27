# frozen_string_literal: true

class Topics::T3Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 3).where(status: 'released')
  end
end
