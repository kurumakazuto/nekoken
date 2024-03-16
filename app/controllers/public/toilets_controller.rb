class Public::ToiletsController < ApplicationController

  def index
    @toilets = Toilet.page(params[:page])
    @toilet = Toilet.new
  end

  def create
    @toilet = current_customer.toilets.new(toilet_params)
    if @toilet.save
      redirect_to toilets_path
    else
      @toilets = Toilet.all
      render :index
    end
  end

  def destroy
    toilet = Toilet.find(params[:id])
    toilet.destroy
    redirect_to toilets_path
  end

  private

  def toilet_params
    params.require(:toilet).permit(:name, :month, :day, :day_of_week, :time_zone, :remarks )
  end
end
