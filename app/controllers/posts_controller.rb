class PostsController < ApplicationController
  before_filter :authorized?, :only => [:new, :create, :show] 
  def index
    @posts = Post.order('created_at DESC').page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    p = params[:post]
    @post = current_user.posts.new(:title => p[:title], :body => p[:body])
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

  def my_posts
    @posts = current_user.posts.order('created_at DESC').page params[:page]
  end

  private 
  #def authorized? end # moved application_controller.rb
end
