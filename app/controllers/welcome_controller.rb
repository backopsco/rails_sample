class WelcomeController < ApplicationController

  def index
    if session[:access_token]

    else
      render text: 'This app should be running on port 5000 and then enter http://lvh.me:5000/scalus/application_authorizations into the URL to get the access token'
    end
  end
end
