#encoding: utf-8

require_relative '../test_helper'

class CommentsTest < ActiveSupport::TestCase
  context "Comments" do
    setup do
      file = File.join(File.dirname(__FILE__),'comments.xml')
      @comments_xml = File.open(file).read
    end

    should "instanciate a collection of comments" do
      stub_request(:get, %r{.*picasaweb.*}).
        to_return(body: @comments_xml, :status => 200)

      @comments = Comment.find('', from: '')

      assert @comments.present?
      @comments.each do |comment|
        assert comment.content.present?
        assert comment.content =~ /I say! What an amusing image!/
      end
    end
  end
end
