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

end
