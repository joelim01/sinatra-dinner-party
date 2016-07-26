class AdminController < ApplicationController

  get '/dinner/new' do
    if Helpers.current_user(session).role == "Admin"
      erb :'/dinner/new'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dinner/new' do
    if Helpers.current_user(session).role == "Admin"
      dinner = Dinner.new(:date => params[:date])
      if dinner.save
        flash[:message] = "Dinner Created."
        erb :'/dinner/new'
      else
        flash[:message] = "Invalid date."
        erb :'/dinner/new'
      end
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  get '/dinner/:id/edit' do
    if Helpers.current_user(session).role == "Admin"
      @dinner = Dinner.find(params[:id])
      erb :'/dinner/edit'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dinner/:id/edit' do
    if Helpers.current_user(session).role == "Admin"
      # dish = Dish.new(:name => params[:name], :ingredients => params[:ingredients], :description => params[:description])
      # dish.dinners << params[:dinner]
      # if dish.save
      #   flash[:message] = "Dish saved."
      #   erb :'/dinner/edit'
      else
        flash[:message] = "Invalid date."
        redirect to '/dinner/admin'
      end
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  get '/dish/new' do
    if Helpers.current_user(session).role == "Admin"

    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dish/new' do
    if Helpers.current_user(session).role == "Admin"
      dish = Dish.new(:name => params[:name], :ingredients => params[:ingredients], :description => params[:description])
      dish.dinners << params[:dinner]
      if dish.save
        flash[:message] = "Dish saved."
        erb :'/dinner/edit'

    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  get '/dish/:id/admin' do
    if Helpers.current_user(session).role == "Admin"

    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dish/:id/admin' do
    if Helpers.current_user(session).role == "Admin"

    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

end
