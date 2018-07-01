require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect '/balls'
    else
      erb :'/users/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/balls'
    else
      erb :'/users/login'
    end
  end

  get '/users/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show'
    else
      flash[:message] = "Please log in."
      redirect '/login'
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      flash[:message] = "Please fill in all parameters."
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
      flash[:message] = "Please enter correct information."
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end
end
