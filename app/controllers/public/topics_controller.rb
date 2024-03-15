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
      redirect_to topics_path
    else
      @customer = current_customer
      render 'public/customers/show'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @customer = @topic.customer
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :introduction, :category, :image)
  end
end
