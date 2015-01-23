require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({ :dbname => "salon" })

  get("/") do
    @stylists = Stylist.all()
    erb(:index)
  end

  post("/stylists") do
    stylist_name = params.fetch("stylist_name")
    stylist = Stylist.new({ :name => stylist_name, :id => nil })
    stylist.save()
    @stylists = Stylist.all()
    erb(:index)
  end

  get("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist)
  end

  delete("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    @stylist.delete()
    @stylists = Stylist.all()
    erb(:submission)
  end

  post("/clients") do
    name = params.fetch("name")
    stylist_id = params.fetch("stylist_id").to_i()
    client = Client.new({ :name => name, :stylist_id => stylist_id })
    client.save()
    @stylist = Stylist.find(stylist_id)
    erb(:stylist)
  end
