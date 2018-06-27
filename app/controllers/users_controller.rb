class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect '/balls'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/balls'
    else
      redirect '/login'
    end
  end
end
