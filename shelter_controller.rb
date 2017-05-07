require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/student.rb')
require_relative('./db/sqlrunner.rb')

get '/home' do
  erb(:home)
end