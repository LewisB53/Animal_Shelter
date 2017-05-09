system("psql -d animal_shelter -f db/animal_shelter.sql")
system("ruby db/seeds.rb")

require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/animal.rb')
require_relative('./models/owner.rb')
require_relative('./db/sqlrunner.rb')



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

get '/animals/assign_owner' do
  @owners = Owner.all
  @animals = Animal.all
  erb(:assign_owner)
end

post '/animals' do
 @owners = Owner.all
 @animals = Animal.all
 erb(:Complete)
end

get '/owners' do
  @all_owners= Owner.all()
  @all_animals= Animal.all()

  erb(:owners)
end

get '/owner/new' do
  @all_owners = Owner.all()
  erb(:new_owner)
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save()
  erb(:Complete)
end

post '/assign_owner' do
  animal = Animal.find(params['id'])
  animal.owner_id = params['owner_id']
  animal.update
  erb(:Complete)
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:edit)
end

post '/animals/:id' do
  @animal = Animal.new(params[:id])
  @animal.update
  erb(:Complete)
end

get '/animals/:id/' do
  @animal = Animal.find(params[:id])
  erb(:index)
end

post '/animals/:id/delete' do
  @animal = Animal.find(params[:id])
  @animal.delete
  erb(:Complete)
end
