#encoding: utf-8

require_relative '../test_helper'

class ImageTest < ActiveSupport::TestCase
  context "image" do
    setup do
      file = File.join(File.dirname(__FILE__),'images.xml')
      @images_xml = File.open(file).read
    end

    should "instanciate a collection of images" do
      stub_request(:get, %r{.*picasaweb.*}).
        to_return(body: @images_xml, :status => 200)

      @images = Image.find('', from: '')

      assert @images.present?
      @images.each do |image|
        assert image.title.present?
        assert image.id.present?
        assert image.thumbnail_url.present?
      end
    end
  end
end
