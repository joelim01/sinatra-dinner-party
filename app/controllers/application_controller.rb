class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  # register Sinatra::Twitter::Bootstrap::Assets

  configure do
    enable :sessions
    set :session_secret, "sercet"
  end

  get "/" do
    erb :home
  end

  get '/dinner/:id' do
    @dinner = Dinner.find(params[:id])
    if Helpers.current_user(session).dinners.include?(@dinner)
      redirect to "/dinner/show/#{params[:id]}"
    else
      redirect to "/dinner/reserve/#{params[:id]}"
    end
  end

  get '/dinner/:id/show' do
    @dinner = Dinner.find(params[:id])
    erb :"/dinner/show"
  end

  post '/dinner/:id/reserve' do
    dinner = Dinner.find(params[:id])
    user = Helpers.current_user(session)
    Reservation.find_or_create_by(:user_id => user.id, :dinner_id => dinner.id)
    redirect to "/user/home"
  end

  post '/comment' do
    dinner = Dinner.find(params[:id])
    user = Helpers.current_user(session)
    Reservation.find_or_create_by(:user_id => user.id, :dinner_id => dinner.id)
    redirect to "/user/home"
  end

end
