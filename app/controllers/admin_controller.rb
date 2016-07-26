class AdminController < ApplicationController

  get '/dinner/new' do
    if Helpers.is_admin?(session)
      erb :'/dinner/new'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dinner/new' do
    if Helpers.is_admin?(session)
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
    if Helpers.is_admin?(session)
      @dinner = Dinner.find(params[:id])
      erb :'/dinner/edit'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dinner/:id/edit' do
    if Helpers.is_admin?(session)
      dinner = Dinner.find(params[:id])
      dinner.date = (params[:date])
      if dinner.save
        flash[:message] = "Dinner Updated."
        redirect to '/dinner/#{params[:id]}'
      else
        flash[:message] = "Invalid date."
        redirect to '/dinner/#{params[:id]}/edit'
      end
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  get '/dish/new' do
    if Helpers.is_admin?(session)
      erb :'/dish/new'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dish/new' do
    if Helpers.is_admin?(session)
      dish = Dish.new(:name => params[:name], :ingredients => params[:ingredients], :description => params[:description])
      dish.dinners << params[:dinner]
      if dish.save
        flash[:message] = "Dish saved."
        redirect to '/dinner/home'
      else
        flash[:message] = "Error, dish was not saved."
        erb :'/dish/new'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  get '/dish/:id/edit' do
    if Helpers.is_admin?(session)
      @dish = Dish.find(params[:id])
      erb :'/dish/edit'
    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

  post '/dish/:id/edit' do
    if Helpers.is_admin?(session)

    else
      flash[:message] = "Log in as a user with admin privileges."
      redirect to '/dinner/home'
    end
  end

end
