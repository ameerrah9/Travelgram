class TripsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def index

    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @trips = @user.trips
    else
      @error = "User doesn't exist" if params[:user_id]
      @trips = Trip.all
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :content, :user_id, :city_id)
  end
end
