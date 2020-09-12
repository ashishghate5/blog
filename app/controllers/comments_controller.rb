class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body).merge( user_id: current_user.id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
