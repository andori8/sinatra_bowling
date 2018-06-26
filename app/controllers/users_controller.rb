class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  get '/users/show' do

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
end
