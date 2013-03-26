class AlbumsController < ApplicationController

  def index
    @albums = Album.find(session[:token])
  end

  def show
    @images = if (r = Image.find(session[:token], from: params[:id])).present?
               r.is_a?(Array) && r.size >= 3 && r[0..2]
              else
                []
              end

    @images.collect! do |image|
      image.update_comments(session[:token],
                            from: {imageid: image.id, albumid: params[:id]})
    end
  end

end
