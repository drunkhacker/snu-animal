class CommentsController < ApplicationController
  def create
    p = params[:comment]
    @comment = Comment.new(:body => p[:body], :author_id => current_user.id, :post_id => params[:post_id])
    if @comment.save
      render :json => @comment.to_json(:include => :animal)
    else
      render :json => {:error => "comment create failed"}, :status => :bad_request
    end
  end
end
