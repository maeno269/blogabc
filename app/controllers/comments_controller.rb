class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], write_id: params[:write_id], user_id: current_user.id)
    redirect_to "/writes/#{@comment.write.id}"
  end
  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
