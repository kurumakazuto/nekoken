class Admin::TagsearchesController < ApplicationController
  
  def search
    @model = Topic
    @word = params[:content]
    @topics = Topic.where("category LIKE?","%#{@word}%").page(params[:page])
    render "admin/tagsearches/tagsearch"
  end
end
