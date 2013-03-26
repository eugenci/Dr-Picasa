#encoding: utf-8

require_relative '../test_helper'

class AlbumTest < ActiveSupport::TestCase
  context "Album" do
    setup do
      file = File.join(File.dirname(__FILE__),'albums.xml')
      @albums_xml = File.open(file).read
    end

    should "do" do
      stub_request(:get, %r{.*picasaweb.*}).
        to_return(body: @albums_xml, :status => 200)
      @albums = Album.find('')

      assert @albums.present?

      @albums.each do |album|
        assert album.title.present?
        assert album.thumbnail_url.present?
        assert album.id.present?
      end
    end
  end
end
