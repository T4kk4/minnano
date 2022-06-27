# frozen_string_literal: true

class AdminController < ApplicationController
  def purge_everything_cache
    if current_admin_user&.admin? || current_admin_user&.normal?
      command = "curl -X POST 'https://api.cloudflare.com/client/v4/zones/#{ENV['CLOUDFLARE_ZONE_ID']}/purge_cache' -H 'X-Auth-Email: #{ENV['CLOUDFLARE_MAIL']}'  -H 'X-Auth-Key: #{ENV['CLOUDFLARE_KEY']}'  -H 'Content-Type: application/json'  --data '{\"purge_everything\":true}'"
      `#{command}`
      flash[:notice] = "キャッシュを削除しました"
      redirect_to manager_root_path
    else
      render_404
    end
  end

  def article_preview
    if current_admin_user&.admin? || current_admin_user&.normal?
      @article = Article.find(params[:id])
      return render_404 if @article.created?
      @markdown = Redcarpet::Markdown.new(CustomRender, autolink: true, tables: true)
      @recommend_articles = Article.where(recommend: true).where.not(priority: 0).order(:priority).limit(5)
      render 'articles/show'
    else
      render_404
    end
  end

  def topic_article_preview
    if current_admin_user&.admin? || current_admin_user&.normal?
      @article = TopicArticle.find(params[:id])
      return render_404 if @article.created?
      @markdown = Redcarpet::Markdown.new(CustomRender, autolink: true, tables: true)
      @recommend_articles = Article.where(recommend: true).where.not(priority: 0).order(:priority).limit(5)
      render 'topics/show'
    else
      render_404
    end
  end
end
