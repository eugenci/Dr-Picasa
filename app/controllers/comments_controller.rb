class CommentsController < ApplicationController
  def create
    url = "#{ApiConfig.base_url}user/default/albumid/#{params[:albumid]}/photoid/#{params[:photoid]}?access_token=#{session[:token]}"

    body = <<-BODY
<entry xmlns='http://www.w3.org/2005/Atom'>
  <content>#{params[:comment]}</content>
  <category scheme="http://schemas.google.com/g/2005#kind"
    term="http://schemas.google.com/photos/2007#comment"/>
</entry>
BODY

    r = HTTParty.post(url, :body => body, :headers => { "Content-type" => "application/atom+xml" })

    redirect_to album_url(params[:albumid])
  end
end
