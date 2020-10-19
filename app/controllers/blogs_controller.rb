class BlogsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @blog = @user.blogs.build
    else
      @blog = Blog.new
    end
    @blog.build_city
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @blogs = @user.blogs.alpha
    else
      @error = "User doesn't exist" if params[:user_id]
      @blogs = Blog.alpha
    end
    if params[:q] && !params[:q].empty?
      @blogs = @blogs.search(params[:q].downcase)
    end
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @blog = Blog.find_by_id(params[:id])
  end

  def delete
    redirect_if_not_logged_in
    @blog = Blog.find_by_id(params[:id])
    if @blog.user == current_user
      @blog.delete
    end
    redirect to '/'
  end
  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :city_id)
  end
end
