class Public::FoodsController < ApplicationController

  def index
    @foods = Food.page(params[:page])
    @food = Food.new
  end

  def create
    @food = current_customer.foods.new(food_params)
    # @food = Food.new(food_params)
    # @food.customer = current_customer

    if @food.save
      redirect_to foods_path
    else
      @foods = Food.page(params[:page])
      render :index
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :amount, :month, :day, :day_of_week, :time_zone, :remarks )
  end

end
