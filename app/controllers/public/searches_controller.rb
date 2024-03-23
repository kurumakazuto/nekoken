class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @type = params[:type]
    @word = params[:word]
    @search = params[:search]
    @topics= Topic.looks(@search,@word,@type).page(params[:page])
  end

end

