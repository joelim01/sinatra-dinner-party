class AdminController < ApplicationController

  get '/dinner/admin' do
    if Helpers.current_user(session).role == "Admin"
      erb :'/dinner/admin'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dinner/admin' do
    if Helpers.current_user(session).role == "Admin"
      dinner = Dinner.new(:date => params[:date])
      if dinner.save
        erb :'/dinner/home'
      else
        flash[:message] = "Invalid date."
        redirect to '/dinner/admin'
      end
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  get '/dinner/:id/admin' do
    if Helpers.current_user(session).role == "Admin"
      @dinner = Dinner.find(params[:id])
      erb :'/dinner/admin'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dinner/:id/admin' do
    if Helpers.current_user(session).role == "Admin"
      dish = Dish.new(:name => params[:name], :ingredients => params[:ingredients], :description => params[:description])
      dish.dinners << params[:dinner]
      if dish.save
        redirect to "/dinner/#{params[:id]}"
      else
        flash[:message] = "Invalid date."
        redirect to '/dinner/admin'
      end
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  get '/dish/admin' do
    if Helpers.current_user(session).role == "Admin"

    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dish/admin' do
    if Helpers.current_user(session).role == "Admin"

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
