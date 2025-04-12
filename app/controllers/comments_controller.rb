class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [ :destroy ]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
       redirect_to post_path(@post), notice: "Comment added successfully"
    else
      redirect_to @post, alert: "Failed to add comment"
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    if comment && (current_admin_user.admin?||current_admin_user == @comment.admin_user)
      @comment.destroy
      redirect_to post_path(@post), notice: "Comment deleted successfully"
    else
      redirect_to post_path(@post), alert: "You are not authorized to delete this comment"
    end
  end

private
def comment_params
  params.expect(comment: [ :commenter, :body ])
end
end
