class BedsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :index]

  def index
    @beds = Bed.all

    @beds = Bed.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@beds) do |bed, marker|
      marker.lat bed.latitude
      marker.lng bed.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @bed = Bed.new
    # @user = current_user
  end

  def create
    @bed = Bed.create(bed_params)
    @bed.user = current_user
    if @bed.save
      redirect_to bed_path(@bed)
    else
      render :new
    end
  end

  def show
    set_bed

    @booking = Booking.new
    @checkin = params['checkin_on']
    @checkout = params['checkout_on']
    from = @checkin.split("/")
    to = @checkout.split("/")
    start = Date.new(from[2].to_f, from[1].to_f - 1, from[0].to_f)
    finish = Date.new(to[2].to_f, to[1].to_f - 1, to[0].to_f)
    @nb_days = (finish - start).to_f
    @total_price = (@nb_days * @bed.price.to_f).round
    @bed = Bed.find(params[:id])
    @bookings = @bed.bookings
    @alert_message = "You are viewing the bed of #{@bed.user.first_name}"
  end

  def edit
    set_bed
  end


  def update
    set_bed
    @bed.update(bed_params)
    redirect_to bed_path(@bed)
  end

  def destroy
    set_bed
    @bed.destroy
    redirect_to root_path
  end


  private

  def bed_params
    params.require(:bed).permit(:address, :title, :photo, :price, :description, :country, :city, :zipcode, :photo, :blanket_type, :pillow, :breakfast)
  end

  def set_bed
    @bed = Bed.find(params[:id])
  end

end
