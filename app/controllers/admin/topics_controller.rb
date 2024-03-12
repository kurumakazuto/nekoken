class Admin::TopicsController < ApplicationController

  def index
    @customers = Customer.all
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :introduction)
  end
end
