# frozen_string_literal: true

class SearchController < ApplicationController
  def show
    if params[:area]
      cities = City.where(area: params[:area])
    else
      cities = City.find_by_prefecture_and_city(params[:prefecture], params[:city])
    end
    @tax_accountants = TaxAccountant
                           .find_by_industry_and_field(
                               cities,
                               params[:specialty_industry],
                               params[:specialty_field],
                               params[:page]
                           )
  end
end
