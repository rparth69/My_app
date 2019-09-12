class CustomersController < ApplicationController
  def index
     @customers = Customer.all
  end

  def show
     @customer = Customer.find(params[:id])
     @cities = City.all
  end

  def my_booking
    @customer = Customer.find(params[:customer_id])
    @bookings =  @customer.bookings
  end

  def new
     @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    if @customer = Customer.new(customer_params)
      @customer.save
      redirect_to @customer
    else
      flash[:danger] = 'alredy number add'
    end    
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_paths
  end

  private
  def customer_params
     params.require(:customer).permit(:first_name, :last_name, :phone_number)
  end
end
