require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/animal.rb')
require_relative('./models/owner.rb')
require_relative('./db/sqlrunner.rb')

get '/home' do
  erb(:home)
end

get '/animals' do 
  @all_animals = Animal.all()
  erb(:index)
end

get '/animals/new' do
  @owners = Owner.all
  erb(:new)
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:create)
end