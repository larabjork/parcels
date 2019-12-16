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
  name = params[:name]
  width = params[:width]
  height =params[:height]
  length = params[:length]
  weight = params[:weight]
  distance = params[:distance]
  parcel = Parcel.new(name, nil, width, height, length, weight, distance)
  parcel.save()
  @parcels = Parcel.all()
  erb(:parcels)
end



patch('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  if params[:name] != ""
    @parcel.update_name(params[:name])
  end
  if params[:width] != ""
    @parcel.update_width(params[:width])
  end
  if params[:height] != ""
    @parcel.update_height(params[:height])
  end
  if params[:length] != ""
    @parcel.update_length(params[:length])
  end
  if params[:weight] != ""
    @parcel.update_weight(params[:weight])
  end
  if params[:distance] != ""
    @parcel.update_distance(params[:distance])
  end
  @parcels = Parcel.all
  erb(:parcels)
end

delete('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
