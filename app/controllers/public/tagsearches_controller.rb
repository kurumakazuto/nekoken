class Public::TagsearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @model = Topic
    @word = params[:content]
    @topics = Topic.where("category LIKE?","%#{@word}%").page(params[:page])
    #render "public/tagsearches/tagsearch"
  end
end
