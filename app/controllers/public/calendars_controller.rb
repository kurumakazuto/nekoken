class Public::CalendarsController < ApplicationController

  def index
    @events = Calendar.where(customer_id: current_customer.id)
    @event = Calendar.new
  end

  def create
    @event = current_customer.calendars.new(calendar_params)
    if @event.save
      redirect_to calendars_path
    else
      @events = Calendar.all
      render :index
    end
  end

  def show
    @event = Calendar.find(params[:id])
  end

  def edit
    @event = Calendar.find(params[:id])
  end

  def update
    @event = Calendar.find(params[:id])
    if @event.update(calendar_params)
      redirect_to calendars_path
    else
      render "edit"
    end
  end

  def destroy
    event = Calendar.find(params[:id])
    event.destroy
    redirect_to calendars_path
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :content, :start_time)
  end

end
