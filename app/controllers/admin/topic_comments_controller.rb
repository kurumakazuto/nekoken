class Admin::TopicCommentsController < ApplicationController
  before_action :authenticate_admin!

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
