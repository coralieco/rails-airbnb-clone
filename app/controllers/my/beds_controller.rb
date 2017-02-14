class My::BedsController < ApplicationController
  def index
    @beds = current_user.beds
  end
end
