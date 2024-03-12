class Admin::TopicsController < ApplicationController

  def index
    @customers = Customer.all
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @customer = @topic.customer
  end

  def edit
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :introduction)
  end
end
