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

  def show
    redirect_if_not_logged_in
    @blog = Blog.find_by_id(params[:id])
  end

  def destroy
    redirect_if_not_logged_in
    @blog = Blog.find_by_id(params[:id])
    if @blog.user == current_user
      @blog.destroy
    end
    redirect_to @blog.user
  end

  def edit
    @blog = Blog.find_by_id(params[:id])
    if !@blog
      flash[:message] = "Blog was not found"
      redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find_by_id(params[:id])
    redirect_to blogs_path if @blog.user != current_user
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :city_id)
  end
end
