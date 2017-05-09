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


# post '/animals/delete' do
#   Animal.remove(params[:id])
#   erb(:Complete)
# end
