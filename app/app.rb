ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'bcrypt'


class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do

  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
   if user
     session[:user_id] = user.id
     redirect to '/links'
   else
     flash.now[:errors] = ['The email or password is incorrect']
     erb :'/sessions/new'
   end

  end

  get '/users/new' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect to '/links'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'/users/sign_up'
    end
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(
      url: params[:url],
      title: params[:title])
    tags = Tag.make_tags(params[:tags])
    tags.each do |name|
      tag = Tag.create(tag: name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/links/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  run! if app_file == $0
end
