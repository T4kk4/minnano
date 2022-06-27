# frozen_string_literal: true

class TaxAccountantsController < ApplicationController
  def show
    @tax_accountant = TaxAccountant.find(params[:id])
    @markdown = Redcarpet::Markdown.new(DefaultRender, autolink: true, tables: true)
    @new_articles = Article.where(status: :released).order('created_at desc').limit(10)
  end
end
