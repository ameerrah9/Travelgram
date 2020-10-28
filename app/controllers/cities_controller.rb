class CitiesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @city = City.new
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @city = @user.city
    else
      @error = "That city doesn't exist" if params[:blog_id]
      @city = City.all
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
      @city = City.find_by(id: params[:id])
      if !@city
        flash[:message] = "City was not found"
        redirect_to city_path
      end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
