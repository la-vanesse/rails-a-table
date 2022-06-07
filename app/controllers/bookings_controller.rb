class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_product, only: %i[new create]
  before_action :set_user, except: %i[index show]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.product = @product
    @booking.user = current_user
    @booking.start_date = @booking.start_date
    @booking.end_date = @booking.end_date
    @product.is_booked = true
    if @booking.save
      redirect_to product_path(@product), notice: 'Booking was successfully created.'
    else
      render :new, notice: 'Booking was not created. Please fill fields with valid information.'
    end
  end

  def show
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_user
    @user = current_user
  end
end
