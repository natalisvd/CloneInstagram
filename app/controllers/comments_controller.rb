class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = @commentable.comments.create(user: current_user, body: params[:comment_body])
    respond_to do |format|
      if params[:commentable_type] == 'Post'
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "post#{@commentable.id}comments",
            partial: 'posts/post_comments',
            locals: { post: @commentable }
          )
        end
      elsif params[:commentable_type] == 'Comment'
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "comment#{@commentable.id}action",
            partial: 'posts/comment_comments',
            locals: { comment: @commentable }
          )
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless @comment.user == current_user

    @comment.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("p#{@comment.commentable_type}#{@comment.commentable_id}ModalComment#{@comment.id}")
      end
    end
  end

  private

  def set_post
    if params[:commentable_type] == 'Post'
      @commentable  = Post.find(params[:commentable_id])
    elsif params[:commentable_type] == 'Comment'
      @commentable  = Comment.find(params[:commentable_id])
    end
  end
end
