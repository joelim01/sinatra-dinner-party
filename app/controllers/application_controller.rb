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

  get '/dinner/home' do
    erb :'/dinner/home'
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
    dinner = Dinner.find(params[:dinner_id])
    user = Helpers.current_user(session)
    if params[:dish_id] != ""
      dish = Dish.find(params[:dish_id])
      Comment.create(:user_id => user.id, :dinner_id => dinner.id, :dish_id => dish.id, :content => params[:content])
    else
      Comment.create(:user_id => user.id, :dinner_id => dinner.id, :content => params[:content])
    end
    redirect to "/dinner/#{dinner.id}/show"
  end

  get '/comment/:id/edit' do
    @comment = Comment.find(params[:id])
    erb :"/comment/edit"
  end

  post '/comment/:id/edit' do
    @comment = Comment.find(params[:id])
    @comment.content = params[:content]
    @comment.save
    redirect to "/dinner/#{@comment.dinner_id}/show"
  end

  delete '/comment/:id/delete' do
    comment = Comment.find(params[:id])
    if comment.user_id == Helpers.current_user(session).id
      Comment.delete(params[:id])
    end
    redirect to "/dinner/#{comment.dinner_id}/show"
  end

end
