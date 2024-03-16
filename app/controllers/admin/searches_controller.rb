class Admin::SearchesController < ApplicationController
   before_action :authenticate_admin!

  def search
    @type = params[:type]
    @word = params[:word]
    @search = params[:search]
    @topics= Topic.looks(@search,@word,@type).page(params[:page])
  end

end