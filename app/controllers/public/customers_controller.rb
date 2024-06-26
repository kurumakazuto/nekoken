class Public::CustomersController < ApplicationController

  before_action :authenticate!
  before_action :is_matching_login_customer, only: [:edit, :update]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @topic = Topic.new
    @topics = @customer.topics.page(params[:page])
    @events = Calendar.where(customer_id: current_customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if customer_params[:image] != nil
      @customer.image_check = Vision.get_image_data(customer_params[:image])
    else
      @customer.image_check = true
    end
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer)
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def withdrawn
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:topic_id)
    @favorite_topics = Topic.where(id: favorites).page(params[:page])
    #上のコードは記事だと@favorite_topics = Topic(find[:favorites])だったが、単一のオブジェクトではなく配列として渡すためにwhereを使用している。
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :encryted_password, :cat_name, :cat_gender, :introduction, :is_active, :image)
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to topics_path
    end
  end

end
