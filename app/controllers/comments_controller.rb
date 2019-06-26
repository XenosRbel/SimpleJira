class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @comment = build_comment_for_post.save
    redirect_to post_path(@post)
  end

  private

  def build_comment_for_post
    @post.comments.new(user_id: current_user.id,
                                  content: params[:comment][:content],
                                  post_id: params[:post_id])
  end
end