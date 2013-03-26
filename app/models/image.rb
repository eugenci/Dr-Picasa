class Image < Base
  attr_accessor :id, :title, :thumbnail_url

  def initialize(record)
    @id            = record.at('id').innerText
    @title         = record.at('title').innerText
    @thumbnail_url = record.at('media:group').search('media:thumbnail').last.get_attribute('url')
  end

  class << self
    def find(token, options = {})
      albumid = options[:from]
      r = HTTParty.get(ApiConfig.base_url + 'user/default/albumid/'+albumid+'?access_token='+token.to_s,
                       headers: {'GData-Version' => '2'}) 
      doc = Hpricot(r.parsed_response)
      instanciate_collection( doc.search('//entry') )
    end
  end
end
