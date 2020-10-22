class BlogsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:update, :destroy]

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
      @blogs = @user.blogs.newest
    else
      @error = "User doesn't exist" if params[:user_id]
      @blogs = Blog.newest
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

  def show; end

  def destroy
    @blog.destroy

    redirect_to current_user
  end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def authenticate_user!
    redirect_to blogs_path if @blog.user != current_user
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :city_id)
  end
end
