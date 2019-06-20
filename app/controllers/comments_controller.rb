class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.new(user_id: current_user.id,
                                  content: params[:comment][:content],
                                  post_id: params[:post_id])
    @comment.save
    redirect_to post_path(@post)
  end
end
