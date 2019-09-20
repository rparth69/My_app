# frozen_string_literal: true

# session controller for login users
class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(phone_number: params[:session][:phone_number])
    session[:user_id] = @user.id
    if @user.present?
      redirect_to user_path(id: @user.id)
    else
      flash[:danger] = 'Invalid Phone Number !'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = ''
    redirect_to login_path
  end
end
