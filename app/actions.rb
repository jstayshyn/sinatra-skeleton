# Homepage (Root path)
get '/' do
  erb :index
end

get '/users/new' do
  erb :"users/new"
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


get 'movies' do
  erb :movie
end


