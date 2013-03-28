#encoding: utf-8

require_relative '../test_helper'

class CommentsTest < ActiveSupport::TestCase
  context "Comments" do
    setup do
      file = File.join(File.dirname(__FILE__),'../files/comments.xml')
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

    should "post a http request when creating a comment" do
      stub_post = stub_request(:post, ApiConfig.base_url+"user/default/albumid/albumid/photoid/photoid?access_token=token&v=2")

      Comment.create('albumid','photoid','this is a comment','token')
      assert_requested(stub_post, body: Comment.body('this is a comment'))
    end
  end
end
