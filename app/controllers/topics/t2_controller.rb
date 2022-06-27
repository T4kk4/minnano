# frozen_string_literal: true

class Topics::T2Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 2).where(status: 'released')
  end
end
