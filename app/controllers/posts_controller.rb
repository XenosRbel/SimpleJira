class PostsController < ApplicationController
  def index
    @posts = Post.all

    authorize! :read, @posts
  end

  def edit
    @post = Post.find(params[:id])

    authorize! :edit, @post
  end

  def show
    @post = Post.find(params[:id])

    authorize! :show, @post
  end

  def new
    @post = Post.new

    authorize! :new, @post
  end

  def create
    @post = Post.new(posts_params)

    authorize! :create, @post

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    authorize! :update, @postuser

    if @post.update(posts_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])

    authorize! :destroy, @post

    @post.destroy

    redirect_to posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:content, :project_id)
  end
end
