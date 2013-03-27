class Comment < Base
  class << self
    def find(token, options = {})
      albumid = options[:albumid]
      photoid = options[:imageid]
      url = "#{ApiConfig.base_url}user/default/albumid/#{albumid}/photoid/#{photoid}?kind=comment&&access_token=#{token.to_s}"
      find_every(token,url)
    end

  end
end
