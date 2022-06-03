class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_product, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.product = @product
    @booking.start_date = @booking.start_date
    @booking.end_date = @booking.end_date
    # @booking.product.is_booked = true
    if @booking.save
      @booking.product.is_booked = true
      redirect_to product_path(@product.id), notice: 'Booking was successfully created.'
    else
      render :new, notice: 'Booking was not created. Please fill fields with valid information.'
    end
  end

  def destroy
    @booking.destroy
    redirect_to product_path(@product), notice: 'Selected Booking was successfully canceled.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :product_id) # :user_id
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
