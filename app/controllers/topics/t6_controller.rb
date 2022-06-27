# frozen_string_literal: true

class Topics::T6Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 6).where(status: 'released')
  end
end
