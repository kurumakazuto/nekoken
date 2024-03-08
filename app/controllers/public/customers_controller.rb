class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customers = Customer.all
  end

  def show
    @customer = find(params[:id])
    @topic = Topic.new
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to mypage_path, notice: "更新しました。"
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :encryted_password, :cat_name, :cat_gender, :introduction, :is_active, :image)
  end
end
