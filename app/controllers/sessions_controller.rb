class SessionsController < ApplicationController
  def new
    @login_url = client.auth_code.authorize_url(
                              redirect_uri: ApiConfig.redirect_uri,
                              scope: ApiConfig.scope)
  end

  def callback
    token = client.auth_code.get_token(params[:code],
                    redirect_uri:  "http://localhost:3000/callback",
                    token_method: :post)

    session[:token] = token.token

    redirect_to albums_url
  end

  def destroy
  end
end
