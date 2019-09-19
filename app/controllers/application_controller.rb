# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
  def rescue_404
    render file: 'public/404'
  end
end
