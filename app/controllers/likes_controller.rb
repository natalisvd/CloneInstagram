class LikesController < ApplicationController
  before_action :set_likeable

  def toggle_like
    if (@like = @likeable.likes.find_by(user: current_user))
      @like.destroy
    else
      @likeable.likes.create(user: current_user)
    end
    respond_to do |format|
      if params[:likeable_type] == 'Post'
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "post#{@likeable.id}action",
            partial: 'posts/post_action',
            locals: { post: @likeable }
          )
        end
      elsif params[:likeable_type] == 'Comment'
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "comment#{@likeable.id}action",
            partial: 'posts/comment_action',
            locals: { comment: @likeable }
          )
        end
      end
    end
  end

  private

  def set_likeable
    if params[:likeable_type] == 'Post'
      @likeable  = Post.find(params[:likeable_id])
    elsif params[:likeable_type] == 'Comment'
      @likeable  = Comment.find(params[:likeable_id])
    end
  end
end
