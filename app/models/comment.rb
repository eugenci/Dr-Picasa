class Comment < Base
  class << self
    def find(token, options = {})
      albumid = options[:albumid]
      photoid = options[:imageid]
      url = "#{ApiConfig.base_url}user/default/albumid/#{albumid}/photoid/#{photoid}?access_token=#{token.to_s}"
      find_every(token,url)
    end
  end

  def udpate_comments(token, options)
    @comments = Comment.find(token, options)
  end
end
