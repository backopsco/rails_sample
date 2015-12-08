class TasksController < ApplicationController

  def index
    conn = Faraday.new( url: "http://hq.lvh.me:4000") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    conn.headers['Content-Type'] = 'application/vnd.api+json'
    #conn.params['access_token']  = session[:access_token]

    response = conn.get '/api/external/tasks', { access_token: session[:access_token] }     # GET http://hq.lvh.com:4000/api/external/tasks.json

    if response.status < 400
      @tasks = JSON.parse(response.body)
    else
      redirect_to root_url
    end
  end
end
