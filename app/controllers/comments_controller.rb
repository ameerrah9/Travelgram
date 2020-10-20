class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_comment, only: [:show, :edit, :update]
  before_action :redirect_if_not_comment_author, only: [:edit, :update]

  def index
    if params[:blog_id] && @blog = Blog.find_by_id(params[:blog_id])
      @comments = @blog.comments
    else
      @error = "That blog doesn't exist" if params[:blog_id]
      @comments = Comment.all
    end
  end

  def new
    if params[:blog_id] && @blog = Blog.find_by_id(params[:blog_id])
      @comment = @blog.comments.build
    else
      @error = "That blog doesn't exist" if params[:blog_id]
      @comment = Comment.new
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to @comment.blog
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    redirect_to comments_path if @comment.user != current_user
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :blog_id)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
    if !@comment
      flash[:message] = "Comment was not found"
      redirect_to comments_path
    end
  end

  def redirect_if_not_comment_author
    redirect_to comments_path if @comment.user != current_user

  end
end
