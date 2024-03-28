class Admin::TagsearchesController < ApplicationController
  before_action :authenticate_admin!
  
  def search
    @model = Topic
    @word = params[:content]
    @topics = Topic.where("category LIKE?","%#{@word}%").page(params[:page])
    #render "admin/tagsearches/tagsearch"
  end
end
