#encoding: utf-8

require_relative '../test_helper'

class ApiConfigTest < ActiveSupport::TestCase
  context "Accessing Configuration from config/api_config.yml" do
    setup do
      @conf = ApiConfig.new
    end

    should "be able to get client_id" do
      assert @conf.client_id.present?
    end

    should "be able to get client_secret" do
      assert @conf.client_secret.present?
    end

    should "be able to get config params as class methods" do
      assert ApiConfig.base_url.present?
    end
  end
end
