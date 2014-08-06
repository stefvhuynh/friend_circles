class CommentsController < ApplicationController
  before_filter :require_signed_in!

  def create
    @comment = current_user.comments.build(comment_params)
    flash[:errors] = @comment.errors.full_messages unless @comment.save
    redirect_to post_url(@comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end

end
