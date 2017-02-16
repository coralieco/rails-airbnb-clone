class BookingsController < ApplicationController


  def create
    @bed = Bed.find(params[:bed_id])
    @booking = Booking.new(booking_params)
    @booking.bed = @bed
    @booking.user = current_user
    @booking.status = "Pending guest request"
    @booking.value = (@booking.checkout_on - @booking.checkin_on).to_f * @booking.bed.price.to_f
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to bed_path(@bed)
    end
  end

  def index

  end

  def show
    set_booking
    @bed = @booking.bed
  end

  def update
    set_booking
    @booking.status = "Pending host validation"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin_on, :checkout_on, :value, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
