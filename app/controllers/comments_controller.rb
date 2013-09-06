class CommentsController < ApplicationController
  include ActionController::Live

  def show
    comment = Comment.find(params[:id])
    render :partial => "comments/comment", :locals => {:comment => comment}
  end

  def create
    response.headers['Content-Type'] = 'text/javascript'
    p = params[:comment]
    @comment = current_user.comments.new(:body => p[:body], :post_id => params[:post_id])
    Redis.new.publish("post.#{@comment.post.id}.comment", @comment.to_json) if @comment.save
  end
end
