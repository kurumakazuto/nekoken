class Admin::TopicCommentsController < ApplicationController

  def destroy
    topic_comment = TopicComment.find(params[:id])
    topic_comment.destroy
    redirect_to request.referer
  end
end
