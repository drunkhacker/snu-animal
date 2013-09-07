class CommentsController < ApplicationController
  def create
    p = params[:comment]
    @comment = current_user.comments.new(:body => p[:body], :post_id => params[:post_id])
    @comment.save
  end
end
