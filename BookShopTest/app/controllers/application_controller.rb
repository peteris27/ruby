
# require 'sinatra/reloader' if development? # Learn more about the reloader at sinatrarb.com
# require "sinatra"
# require "sinatra/multi_route"
# require 'sinatra/contrib'
# require 'sinatra/activerecord'
# require 'active_record'

require './config/environment'

class ApplicationController < Sinatra::Base
  set :erubis, :escape_html => true

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super secret"
  end

  get "/" do
    erb :home
  end

  helpers do
    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
