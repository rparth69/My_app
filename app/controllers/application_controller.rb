# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_session, only: %i[show update edit]
  include SessionsHelper
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
  def rescue_404
     render file: 'public/404'
  end

  def check_session
    render 'sessions/new' if session[:user_id].blank?
  end

  def logged_in_user
    (return if logged_in?)
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_path
  end
end
