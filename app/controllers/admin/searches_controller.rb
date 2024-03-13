class Admin::SearchesController < ApplicationController
   before_action :authenticate_admin!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "タイトル"
      @topics_title = Topic.looks(params[:search], params[:word])
    else
      @topics_introduction = Topic.looks(params[:search], params[:word])
    end
  end
  
end
