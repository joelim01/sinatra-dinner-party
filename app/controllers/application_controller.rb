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

  get 'dinner/:id' do
    @dinner = Dinner.find(params[:id])
    if @dinner.reservations.users.include?(Helpers.current_user(session))
      redirect to "/dinner/show/#{params[:id]}"
    else
      redirect to "/dinner/reserve/#{params[:id]}"
    end
  end

  get 'dinner/show/:id'
    @dinner = Dinner.find(params[:id])
    erb
end
