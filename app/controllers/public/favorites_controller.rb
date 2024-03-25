class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @topic = Topic.find(params[:topic_id])
    favorite = current_customer.favorites.new(topic_id: @topic.id)
    favorite.save
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    favorite = current_customer.favorites.find_by(topic_id: @topic.id)
    favorite.destroy
  end
end
