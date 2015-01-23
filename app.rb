require('sinatra')
require('sinatra/reloader')
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
