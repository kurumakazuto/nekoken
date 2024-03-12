class Public::FoodsController < ApplicationController
  
  def index
    @foods = Food.all
    @food = Food.new
  end
  
  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to food_path(@food.id)
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
    params.require(:food).permit(:name, :image)
  end
end
