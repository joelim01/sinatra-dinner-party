class UserController < ApplicationController

  get '/user/new' do
    erb :'/user/new'
  end

  post '/user' do
    puts params
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
    if !!(session[:user_id])
      redirect to '/user/home'
    else
      erb :'/user/login'
    end
  end

  get '/user/home' do
    erb :'/user/home'
  end

  post '/user/login' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/user/home'
    else
      erb :'/user/login'
    end
  end

  get '/user/logout' do
    session.clear
    redirect to '/'
  end

end
