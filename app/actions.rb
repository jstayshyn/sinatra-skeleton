helpers do
 
  def logged_in?
    !current_user.nil?
  end
 
  def current_user
    if session[:user_id]
      User.find session[:user_id]
    else
      nil
    end
  end
 
end


# Homepage (Root path)
get '/' do
  erb :index
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  # create a new user with the data (in params) that was posted to us
  xuser = User.create(params)

  #(logging in) when we have a new user, create a session for them
  session[:user_id] = xuser.id

  # redirect user to their profile page
  redirect '/profile'
end

get '/profile' do
  # find the user using the user_id we save in the session
  @user = User.find(session[:user_id])
  erb :"users/profile"
end


get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by({email: params[email]})
  if @user 
    if @user.password == params[:password]
      #log user in
      session[@user_id] = @user_id
      redirect '/profile'
    end  
  else
    # user was not found
    # or password was incorrect
    redirect 'login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get 'movies' do
  erb :movie
end

get '/movies/new/' do
  erb :"movies/new"
end


