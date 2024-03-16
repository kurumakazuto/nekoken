class Public::TopicCommentsController < ApplicationController

  def create
    topic = Topic.find(params[:topic_id])
    comment = current_customer.topic_comments.new(topic_comment_params)
    comment.topic_id = topic.id
    comment.save
    redirect_to topic_path(topic)
  end

  private

  def topic_comment_params
    params.require(:topic_comment).permit(:comment)
  end

end
