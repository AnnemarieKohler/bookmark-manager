class BookmarkManager < Sinatra::Base
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

  get '/users/reset' do
    erb :'/users/reset'
  end

  post '/users/reset' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end

    erb :'/users/confirmation'
  end
end
