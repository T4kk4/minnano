# frozen_string_literal: true

class Topics::T9Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 12).where(status: 'released')
  end
end
