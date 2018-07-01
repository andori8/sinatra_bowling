require 'rack-flash'
class BallsController < ApplicationController
  use Rack::Flash

  get '/balls' do
    if logged_in?
      @balls = Ball.all
      @user = User.find(session[:user_id])
      erb :'/balls/index'
    else
      flash[:message] = "Please log in."
      redirect '/login'
    end
  end

  get '/balls/new' do
    if logged_in?
      erb :'/balls/new'
    else
      flash[:message] = "Please log in."
      redirect '/login'
    end
  end

  get '/balls/:id' do
    if logged_in?
      @ball = Ball.find(params[:id])
      erb :'/balls/show'
    else
      flash[:message] = "Please log in."
      redirect '/login'
    end
  end

  get '/balls/:id/edit' do
    if logged_in?
      @ball = Ball.find(params[:id])
      erb :'/balls/edit'
    else
      flash[:message] = "Please log in."
      redirect '/login'
    end
  end

  post '/balls' do
    if params[:name].empty? || params[:brand].empty? || params[:color].empty? || params[:weight].empty? || params[:coverstock].empty? || params[:release_date].empty?
      redirect '/balls/new'
    else
      current_user.balls.create(name: params[:name], brand: params[:brand], color: params[:color], weight: params[:weight], coverstock: params[:coverstock], release_date: params[:release_date])
      redirect '/balls'
    end
  end

  patch '/balls/:id/edit' do
    @ball = Ball.find(params[:id])
    if current_user == @ball.user
      if params[:name].empty? || params[:brand].empty? || params[:color].empty? || params[:weight].empty? || params[:coverstock].empty? || params[:release_date].empty?
        redirect "/balls/#{@ball.id}/edit"
      else
        @ball.update(name: params[:name], brand: params[:brand], color: params[:color], weight: params[:weight], coverstock: params[:coverstock], release_date: params[:release_date])
        @ball.save
        redirect '/balls'
      end
    else
      redirect '/balls'
    end
  end

  delete '/balls/:id/delete' do
    @ball = current_user.balls.find(params[:id])
    if @ball && @ball.destroy
      redirect '/balls'
    else
      redirect "/balls/#{params[:id]}"
    end
  end
end
