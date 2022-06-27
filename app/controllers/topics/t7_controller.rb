# frozen_string_literal: true

class Topics::T7Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 7).where(status: 'released')
  end
end
