class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_product, only: %i[new create]
  before_action :set_user, except: %i[index show]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    Booking.product = @product
    @booking.user = current_user
    Booking.start_date = @booking.start_date.to_date
    Booking.end_date = @booking.end_date.to_date

    if @booking.save
      redirect_to home_path, notice: 'Booking was successfully created.'
    else
      render :new, notice: 'Booking was not created. Please fill fields with valid information.'
    end
  end

  # show bookings made by current user
  def show
    @bookings = Booking.where(user: current_user)
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Selected Booking was successfully canceled.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
