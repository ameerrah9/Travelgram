class CitiesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @city = City.new
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @cities = @user.city.by_name
    else
      @error = "That city doesn't exist" if params[:blog_id]
      @cities = City.by_name
    end
  end

  def create
    @city = City.new(city_params)
    if @city.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @city = City.find(params[:id])
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
