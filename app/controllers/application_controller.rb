class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, "sercet"
  end

  get "/" do
    if Helpers.is_logged_in?(session)
      redirect to '/user/home'
    else
      erb :home
    end
  end

end
