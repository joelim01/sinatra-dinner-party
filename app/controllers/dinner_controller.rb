class DinnerController < ApplicationController

  get '/dinner/home' do
    if Helpers.is_logged_in?(session)
      erb :'/dinner/home'
    else
      flash[:message] = "Please log in to view that page."
      redirect to '/'
    end
  end

  get '/dinner/:id' do
    if Helpers.is_logged_in?(session)
      @dinner = Dinner.find(params[:id])
      if Helpers.current_user(session).dinners.include?(@dinner) || Helpers.is_admin?(session)
        erb :"/dinner/show"
      else
        redirect to "/dinner/#{params[:id]}/reserve"
      end
    else
      flash[:message] = "Please log in to view that page."
      redirect to '/'
    end
  end

  post '/dinner/:id/reserve' do
    if Helpers.is_logged_in?(session)
      dinner = Dinner.find(params[:id])
      user = Helpers.current_user(session)
      Reservation.find_or_create_by(:user_id => user.id, :dinner_id => dinner.id)
      flash[:message] = "You've reserved a spot."
      redirect to "/user/home"
    else
      flash[:message] = "Please log in to view that page."
      redirect to '/'
    end
  end

  get '/dish/home' do
    if Helpers.is_logged_in?(session)
      erb :'/dish/home'
    else
      redirect to '/'
      flash[:message] = "Please log in to view that page."
    end
  end
end
