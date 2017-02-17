class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

  def home
    @bed = Bed.new
    @beds = Bed.all
  end
end
