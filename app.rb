require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcels') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcels/new') do
  erb(:new_parcel)
end

get('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

get('/parcels/:id/edit') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end

post('/parcels') do
  name = params[:parcel_name]
  parcel = binding.pryarcel.new(name, nil)
  parcel.save()
  @parcels = Parcel.all()
  erb(:parcels)
end

get('/parcels/:id/edit') do
  "This will take us to a page with a form for updating an parcel with an ID of #{params[:id]}."
end

patch('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:name])
  @parcels = Parcel.all
  erb(:parcels)
end

delete('/parcels/:id') do
  @parcel = parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
