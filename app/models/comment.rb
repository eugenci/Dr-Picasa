class Comment < Base

  class << self

    def body(content = '')
      <<-BODY
<entry xmlns='http://www.w3.org/2005/Atom'>
  <content>#{content}</content>
  <category scheme="http://schemas.google.com/g/2005#kind"
    term="http://schemas.google.com/photos/2007#comment"/>
</entry>
      BODY
    end

    def create(albumid, photoid, content, token)
      url = "/user/default/albumid/#{albumid}/photoid/#{photoid}?access_token=#{token}"

      post(url, body: body(content), headers: { "Content-type" => "application/atom+xml" })
    end

    def find(token, options = {})
      albumid = options[:albumid]
      photoid = options[:imageid]
      url = "/user/default/albumid/#{albumid}/photoid/#{photoid}?kind=comment&&access_token=#{token.to_s}"
      find_every(token,url)
    end

  end
end
