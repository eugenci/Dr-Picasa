class Album < Base
  class << self
    def find(token)
      url = '/user/default?access_token='+ token.to_s
      find_every(token,url)
    end
  end
end
