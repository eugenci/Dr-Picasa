class Base

  attr_accessor :id, :title, :thumbnail_url, :comments

  def initialize(record)
    @id            = record.at('gphoto:id').innerText
    @title         = record.at('title').innerText
    @thumbnail_url = record.at('media:group').search('media:thumbnail').last.get_attribute('url')
  end

  class << self
    def instanciate_collection(collection)
      collection.collect! {|record| instanciate_record(record) }
    end

    def instanciate_record(record)
      new(record)
    end

    def find_every(token, url, options = {})
      r = HTTParty.get(url, headers: {'GData-Version' => '2'}) 
      doc = Hpricot(r.parsed_response) if r.respond_to?(:parsed_response)

      instanciate_collection( doc.search('//entry') ) if doc.respond_to?(:search)
    end
  end
end
