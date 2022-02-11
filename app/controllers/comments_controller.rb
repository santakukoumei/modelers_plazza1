class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to work_path(@comment.work)
    else
      @work = @comment.work
      @comments = @work.comments
      render "works/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, work_id: params[:work_id])
  end
end
