# frozen_string_literal: true

class Topics::T4Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 4).where(status: 'released')
  end
end
