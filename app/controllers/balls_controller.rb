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

  get '/balls/:id' do
    @ball = Ball.find(params[:id])
    erb :'/balls/show'
  end

  get '/balls/:id/edit' do
    @ball = Ball.find(params[:id])
    erb :'/balls/edit'
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
end
