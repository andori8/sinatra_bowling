class BallsController < ApplicationController
  get '/balls' do
    @balls = Ball.all
    erb :'/balls/index'
  end

  get '/balls/new' do
    if logged_in?
      erb :'/balls/new'
    else
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
end
