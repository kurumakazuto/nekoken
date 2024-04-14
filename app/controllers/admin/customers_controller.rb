class Admin::CustomersController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @topics = @customer.topics.page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render "edit"
    end
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_active: !@customer.is_active)

    if @customer.id_active
      flash[:notice] = "退会処理を実行しました"
    else
      flash[:notice] = "有効にします"
    end
      redirect_to admin_root_path
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
  
end