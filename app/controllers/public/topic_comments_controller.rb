class Public::TopicCommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @topic_comment = current_customer.topic_comments.new(topic_comment_params)
    @topic_comment.topic_id = @topic.id
    @topic_comment.save
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @topic_comment = TopicComment.find(params[:id])
    @topic_comment.destroy
  end

  private

  def topic_comment_params
    params.permit(:comment)
  end

end
