# frozen_string_literal: true

class ApplicationController < ActionController::Base
  if Rails.env.production?
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ::AbstractController::ActionNotFound, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::UnknownFormat, with: :render_404
    rescue_from ActionController::BadRequest, with: :render_400
    rescue_from URI::InvalidURIError, with: :render_404
    rescue_from ActionController::ParameterMissing, with: :render_400
    rescue_from ActionView::MissingTemplate, with: :render_404
  end

  def render_400
    render plain: 'Bad Request', status: 400
  end

  def render_404
    render_error_page 404
  end

  def render_500(e)
    p e
    render_error_page 404
  end

  def render_error_page(status)
    render(
        template: "errors/#{status}.html.erb",
        status: status,
        content_type: 'text/html'
    )
  end
end
