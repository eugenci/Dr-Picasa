class Base
  class << self
    def instanciate_collection(collection)
      collection.collect! {|record| instanciate_record(record) }
    end

    def instanciate_record(record)
      new(record)
    end
  end
end
