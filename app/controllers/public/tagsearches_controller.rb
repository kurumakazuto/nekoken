class Public::TagsearchesController < ApplicationController

  def search
    @model = Topic
    @word = params[:content]
    @topics = Topic.where("category LIKE?","%#{@word}%")
    render "public/tagsearches/tagsearch"
  end
  
end
