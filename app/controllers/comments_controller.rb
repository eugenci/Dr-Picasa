class CommentsController < ApplicationController
  def create
    Comment.create(params[:albumid],
                   params[:photoid],
                   params[:content],
                   session[:token])

    redirect_to album_url(params[:albumid])
  end
end
