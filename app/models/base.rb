class Base

  include HTTParty
  base_uri ApiConfig.base_url
  default_params :v => '2'

  attr_accessor :id, :title, :thumbnail_url, :comments, :content

  def initialize(record)
    @id            = record.at('gphoto:id').innerText
    @title         = record.at('title').innerText
    @thumbnail_url = (c = record.at('media:group')).present? && c.search('media:thumbnail').last.get_attribute('url')
    @content       = (c = record.at('content')).present? && c.innerText 
  end

  class << self
    def instanciate_collection(collection)
      collection.collect! {|record| instanciate_record(record) }
    end

    def instanciate_record(record)
      new(record)
    end

    def find_every(token, url, options = {})
      r = get(url)

      doc = Hpricot(r.parsed_response) if r.respond_to?(:parsed_response)

      instanciate_collection( doc.search('//entry') ) if doc.respond_to?(:search)
    end
  end
end
