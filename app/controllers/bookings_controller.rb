# frozen_string_literal: true

# booking controller for booking
class BookingsController < ApplicationController
  def index
    @city     = City.find(params[:city_id])
    @users    = User.find(params[:user_id])
    @bookings = @user.bookings
  end

  def new
    @booking = Booking.new
    @cities  = City.all
    @user    = City.find(params[:city_id]).users
  end

  def create
    @user    = User.find(params[:user_id])
    @booking = @user.bookings.new(booking_params)
    @booking.save
    redirect_to @user
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :date, :cleaner_id)
  end
end
