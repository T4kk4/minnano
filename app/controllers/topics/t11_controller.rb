# frozen_string_literal: true

class Topics::T9Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 11).where(status: 'released')
  end
end
