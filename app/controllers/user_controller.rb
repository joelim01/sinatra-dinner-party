class UserController < ApplicationController

  get '/user/new' do
    if Helpers.is_logged_in?(session)
      flash[:message] = "You're already logged in."
      erb :'/user/home'
    else
      erb :'/user/new'
    end
  end

  post '/user' do
    user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
    if user.valid?
      user.save
      session[:id] = user.id
      erb :'/user/home'
    else
      erb :'/user/new'
    end
  end

  get '/user/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/user/home'
      flash[:message] = "You're already logged in."
    else
      erb :'/user/login'
    end
  end

  get '/user/home' do
    if Helpers.is_logged_in?(session)
      erb :'/user/home'
    else
      flash[:message] = "Please log in to view that page."
      erb :'/user/login'
    end
  end

  post '/user/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/user/home'
      flash[:message] = "You're already logged in."
    else
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to '/user/home'
      else
        flash[:message] = "Unknown email and password combination. Please try again."
        erb :'/user/login'
      end
    end
  end

  get '/user/logout' do
    session.clear
    flash[:message] = "Logged out."
    redirect to '/'
  end

end
