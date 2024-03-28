class Public::SearchesController < ApplicationController
  before_action :authenticate!

  def search
    #byebug
    @type = params[:type]
    @word = params[:word]
    @search = params[:search]
    @topics= Topic.looks(@search,@word,@type).page(params[:page])
  end

end

