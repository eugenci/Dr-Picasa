class ApplicationController < ActionController::Base
  protect_from_forgery


  def client
    OAuth2::Client.new(ApiConfig.client_id,
                       ApiConfig.client_secret,
                       site: ApiConfig.site,
                       authorize_url: ApiConfig.authorize_url,
                       token_url: ApiConfig.token_url)
  end

end
