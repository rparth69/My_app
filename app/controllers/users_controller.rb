class UsersController < ApplicationController
  before_action :set_user, only: [:show ]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:danger] = 'Alredy Number Added !'
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  end

  def cleaner_booking
    @user = User.find(params[:user_id])
    @bookings =  Booking.where(cleaner_id: params[:user_id])
  end

  def my_booking
    @user = User.find(params[:user_id])
    @bookings =  @user.bookings
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
     params.require(:user).permit(:first_name, :last_name, :phone_number, :user_type, city_ids: [])
  end
end
