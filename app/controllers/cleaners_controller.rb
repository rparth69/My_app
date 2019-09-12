class CleanersController < ApplicationController
  def index
     @cleaners = Cleaner.all
  end

  def show
     @cleaner = Cleaner.find(params[:id])
  end

  def new
     @cleaner = Cleaner.new
  end

  def edit
    @cleaner = Cleaner.find(params[:id])
  end

  def cleaner_booking
    @cleaner = Cleaner.find(params[:cleaner_id])
    @bookings =  @cleaner.bookings
  end

  def create
    @cleaner = Cleaner.new(cleaner_params)
    @cleaner.save
    redirect_to @cleaner
  end

  def update
    @cleaner = Cleaner.find(params[:id])
    if @cleaner.update(cleaner_params)
      redirect_to @cleaner
    else
      render 'edit'
    end
  end

  def destroy
    @cleaner = Cleaner.find(params[:id])
    @cleaner.destroy

    redirect_to root_paths
  end

  private
  def cleaner_params
    params.require(:cleaner).permit(:first_name, :last_name, :quality_score, city_ids: [])
  end
end
