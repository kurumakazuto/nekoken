class Public::TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def my_index
    @customer = current_customer
    @topics = @customer.topics
  end
  
  def create
    @topic = Topic.new(topic_params)
    @topic.customer_id = current_customer.id
    @topic.save
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :introduction)
  end
end
