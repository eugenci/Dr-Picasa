class Image < Base
  class << self
    def find(token, options = {})
      albumid = options[:from]

      url = ApiConfig.base_url +
            'user/default' + albumid + '?access_token='+ token.to_s

      find_every(token, url, options)
    end
  end
end
