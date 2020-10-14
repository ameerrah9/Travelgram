class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:trip_id] && @trip = Trip.find_by_id(params[:trip_id])
      @comments = @trip.comments
    else
      @error = "That trip never happened" if params[:trip_id]
      @comments = Comment.all
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])

  end
end
