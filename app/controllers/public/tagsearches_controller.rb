class Public::TagsearchesController < ApplicationController
  
  before_action :authenticate!

  def search
    @model = Topic
    @word = params[:content]
    @topics = Topic.where("category LIKE?","%#{@word}%").page(params[:page])
    #render "public/tagsearches/tagsearch"
  end
  
end
