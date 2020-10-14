class BlogController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def index

    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @blogs = @user.blogs.alpha
    else
      @error = "User doesn't exist" if params[:user_id]
      @blogs = Blog.alpha
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :city_id)
  end
end
