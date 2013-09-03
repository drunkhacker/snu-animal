class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    p = params[:post]
    @post = Post.new(:title => p[:title], :body => p[:body])
    if @post.save
      redirect_to post_path(@post)
    else
      render new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.page(params[:cpage])
    @comment = Comment.new
  end
end
