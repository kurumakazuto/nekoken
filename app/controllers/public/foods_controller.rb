class Public::FoodsController < ApplicationController

  def index
    @foods = Food.all
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      byebug
      redirect_to foods_path
    else
      @foods = Food.all
      render :index
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :amount, :month, :day, :day_of_week, :time_zone, :remarks, :image)
  end
end
