class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @topic = Topic.new
    @topics = @customer.topics.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
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
  
  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:topic_id)
    @favorite_topics = Topic.find(favorites)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :encryted_password, :cat_name, :cat_gender, :introduction, :is_active, :image)
  end
end
