class BallsController < ApplicationController
  get '/balls' do
    @balls = Balls.all
    erb :index
  end
end
