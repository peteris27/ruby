class UsersController < ApplicationController

    # get '/register' do
    #   if is_logged_in?
    #     erb :'/user_panel/hello_panel'
    #   else
    #    erb :register
    #   end
    # end
    #
    # get '/user_panel/:id' do
    #     @user = User.find_by_id(params[:id])
    #     erb :'/user_panel/hello_panel'
    # end
    #
    #   post '/register' do
    #       @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    #       if @user.save
    #       #@user.save
    #         session[:user_id] = @user.id
    #         erb :'/user_panel/hello_panel'
    #       else
    #         erb :register, locals: {message: "There seems to be an error. Please try again."}
    #       end
    #    end


    get '/register' do
      if is_logged_in?
        erb :'/user_panel/hello_panel'
      else
       erb :'/register'
      end
    end

      get '/user_panel/:id' do
          @user = User.find_by_id(params[:id])
          erb :'/user_panel/hello_panel'
      end

      post '/register' do
          @user = User.new(name: params[:name], surname: params[:surname], username: params[:username], email: params[:email], password: params[:password])

          if @user.save
            session[:user_id] = @user.id
            erb :'/user_panel/hello_panel'
          else
            erb :'/register', locals: {message: "There seems to be an error. Please try again."}
          end
       end

      get '/login' do
        if !is_logged_in?
          erb :login
        else
          erb :'/user_panel/hello_panel'
        end
      end

      post '/login' do
         @user = User.find_by(username: params[:username])
         if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id
           erb :'/user_panel/hello_panel'
          else
            erb :login, locals: {message: "There seems to be an error. Please try again."}
          end
      end

      get '/logout' do
        session.clear
        erb :home
      end

    end
