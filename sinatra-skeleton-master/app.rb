class App < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end
    erb :index

  end

  get '/register' do
    erb :'/register/register'
  end

  post '/register_account' do
    text = ''

    if params['password'] != params['rewrite_password']
      text = 'Passwords are not equal'
    end

    if text.length > 0
      flash[:error] = text
      redirect '/register'
    else
      User.create(username: params['username'],
                  password: params['password'],
                  email: params['email'],
                  gender: params['gender'])

      redirect '/'
    end
  end

  post '/login_account' do
    user = User.first(username: params['username'])

    if user && user.password == params['password']
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:error] = 'Wrong username or password'
      redirect '/register?error=wrong_username_or_password'
    end
  end

  post '/sign_out' do
    session[:user_id] = nil

    redirect '/'
  end

  get '/index.erb' do

    erb :'index'
  end

  get '/account' do

    erb :'/account/account'
  end

  get '/about' do

    erb :'about/about'
  end
end