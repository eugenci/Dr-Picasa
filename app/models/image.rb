class Image < Base

  attr_accessor :albumid

  class << self
    def find(token, options = {})
      albumid = options[:from]

      url = ApiConfig.base_url +
            'user/default/albumid/' + albumid + '?access_token='+ token.to_s

      find_every(token, url, options)
    end
  end

  def update_comments(token, options)
    @comments = Comment.find(token, options)
  end
end
