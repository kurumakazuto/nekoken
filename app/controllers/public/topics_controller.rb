class Public::TopicsController < ApplicationController

   before_action :authenticate!, except: [:index, :show,]

  def index
    @topics = Topic.page(params[:page])
  end

  def my_index
    @customer = current_customer
    @topics = @customer.topics.page(params[:page])
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.customer_id = current_customer.id
    if topic_params[:image] != nil
      @topic.image_check = Vision.get_image_data(topic_params[:image])
    else
      @topic.image_check = true
    end
    if @topic.save
      redirect_to topics_path
    else
      @customer = current_customer
      @events = Calendar.where(customer_id: current_customer.id)
      render 'public/customers/show'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @customer = @topic.customer
    @topic_comment = TopicComment.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if topic_params[:image] != nil
      @topic.image_check = Vision.get_image_data(topic_params[:image])
    else
      @topic.image_check = true
    end
    if @topic.update(topic_params)
      redirect_to topic_path(@topic.id)
    else
      render "edit"
    end
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
