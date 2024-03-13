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
    if @topic.save
      redirect_to topic_path(@topic.id)
    else
      #@customer = current_customer
      #render :show
      redirect_to customer_path(current_customer)
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @customer = @topic.customer
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :introduction, :image)
  end
end
