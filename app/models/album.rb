class Album < Base

  attr_accessor :id, :title, :thumbnail_url

  def initialize(record)
    @id            = record.at('gphoto:id').innerText
    @title         = record.at('title').innerText
    @thumbnail_url = record.at('media:group').at('media:thumbnail').get_attribute('url')
  end

  class << self
    def find(token)
      r = HTTParty.get(ApiConfig.base_url + 'user/default?access_token='+token.to_s,
                       headers: {'GData-Version' => '2'}) 
      doc = Hpricot(r.parsed_response)
      instanciate_collection( doc.search('//entry') )
    end
  end
end
