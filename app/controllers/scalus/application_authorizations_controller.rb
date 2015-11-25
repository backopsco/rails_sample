class Scalus::ApplicationAuthorizationsController < ApplicationController

  def index
    callback = "http://lvh.me:5000/scalus/application_authorizations/callback"
    redirect_to client.auth_code.authorize_url(redirect_uri: callback)
  end

  def callback
    access_token = client.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
    session[:access_token]  = access_token.token
    session[:refresh_token] = access_token.refresh_token

    redirect_to root_url
  end

  private

  def auth_info
    @auth_info ||= ApplicationAuthorization.first
  end

  def client
    OAuth2::Client.new(
        auth_info.client_id,
        auth_info.client_secret,
        site: my_organization_site,
        organization: auth_info.scalus_slug,
        authorize_url:  '/oauth2/authorize',
        token_url:      '/oauth2/token'
    )
  end

  def my_organization_site
    "http://#{auth_info.scalus_slug}.#{org_site}"
  end

  def org_site
    Rails.env.development? ? 'lvh.me:4000' : 'scalus.com'
  end

  def redirect_uri
    uri = URI.parse('http://lvh.me:5000')
    uri.path = '/scalus/application_authorizations/callback'
    uri.query = nil
    uri.to_s
  end

end
