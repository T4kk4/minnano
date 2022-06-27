# frozen_string_literal: true

class Topics::T1Controller < ApplicationController
  def index
    @topic_article =  TopicArticle.where(topic_id: 1).where(status: 'released')
  end
end
