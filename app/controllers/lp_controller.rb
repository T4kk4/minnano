# frozen_string_literal: true

class LpController < ApplicationController
  def index
    @contact = Contact.new
    render layout: false
  end
end
