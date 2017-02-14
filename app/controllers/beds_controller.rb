class BedsController < ApplicationController
skip_before_action :authenticate_user!, only: :new


  def new
    @bed = Bed.new
    # @user = current_user
  end

  def create
    @bed = Bed.create(bed_params)
    @bed.user = current_user
    if @bed.save!
      redirect_to show_bed_path(@bed)
    else
      render :new
    end
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
    redirect_to beds_path
  end


  private

  def bed_params
    params.require(:bed).permit(:address, :title, :photo, :price, :description, :country, :city, :zipcode)
  end

  def set_bed
      @bed = Bed.find(params[:id])
    end

end
