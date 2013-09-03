class CommentsController < ApplicationController
  def create
    p = params[:comment]
    @comment = Comment.new(:body => p[:body], :author_id => current_user.id, :post_id => params[:post_id])
    @comment.save
  end
end
