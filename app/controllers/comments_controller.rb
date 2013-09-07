class CommentsController < ApplicationController
  include ActionController::Live

  def show
    comment = Comment.find(params[:id])
    render :partial => "comments/comment", :locals => {:comment => comment}
  end

  def create
    p = params[:comment]
    @comment = current_user.comments.new(:body => p[:body], :post_id => params[:post_id])
    @comment.save
    #redis = Redis.new
    #redis.publish("post.#{@comment.post.id}.comment", {:id => @comment.id}.to_json) if @comment.save
    #redis.quit
  end
end
