# frozen_string_literal: true

class Topics::T5Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 5).where(status: 'released')
  end
end
