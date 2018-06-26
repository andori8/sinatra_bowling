class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      User.create(username: params[:username], email: params[:email], password: params[:password])
      redirect '/users/show'
    end
  end
end
