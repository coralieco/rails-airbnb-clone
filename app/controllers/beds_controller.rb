class BedsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :index]

  def index
    @beds = Bed.all
  end

  def new
    @bed = Bed.new
    @user = current_user
  end

  def create
    @bed = Bed.create(bed_params)
    if @bed.save!
      redirect_to edit_bed_path(@bed)
    else
      render :new
    end
  end

  private

  def bed_params
    params.require(:bed).permit(:address, :title, :photo, :price, :description)
  end

end
