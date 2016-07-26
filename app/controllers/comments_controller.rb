class CommentsController < ApplicationController

  post '/comment' do
    if Helpers.is_logged_in?(session)
      dinner = Dinner.find(params[:dinner_id])
      user = Helpers.current_user(session)
      if params[:dish_id] != ""
        dish = Dish.find(params[:dish_id])
        Comment.create(:user_id => user.id, :dinner_id => dinner.id, :dish_id => dish.id, :content => params[:content])
      else
        Comment.create(:user_id => user.id, :dinner_id => dinner.id, :content => params[:content])
      end
      redirect to "/dinner/#{dinner.id}"
    else
      flash[:message] = "Please log in to do that."
      redirect to '/'
    end
  end

  get '/comment/:id/edit' do
    if Helpers.is_logged_in?(session)
      @comment = Comment.find(params[:id])
      if Helpers.current_user(session) == @comment.user
        erb :"/comment/edit"
      else
        flash[:message] = "Sorry, you can't edit another user's comment."
        redirect to '/comment/#{params[:id]}'
      end
    else
      flash[:message] = "Please log in to view that page."
      redirect to '/'
    end
  end

  post '/comment/:id/edit' do
    if Helpers.is_logged_in?(session)
      @comment = Comment.find(params[:id])
      @comment.content = params[:content]
      @comment.save
      redirect to '/dinner/#{@comment.dinner_id}'
    else
      redirect to '/'
    end
  end

  delete '/comment/:id/delete' do
    if Helpers.is_logged_in?(session)
      comment = Comment.find(params[:id])
      if comment.user_id == Helpers.current_user(session).id
        Comment.delete(params[:id])
      end
      redirect to "/dinner/#{comment.dinner_id}"
    else
      flash[:message] = "Sorry, you can't delete another user's comment."
      redirect to "/dinner/#{comment.dinner_id}"
    end
  end
end
