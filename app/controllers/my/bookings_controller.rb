class My::BookingsController < ApplicationController
  def index
    @beds = current_user.beds
  end

  def update
    set_booking
    @booking.update(set_params)
    redirect_to my_bookings_path
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_params
    params.require(:booking).permit(:status)
  end

end

