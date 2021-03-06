require('rspec')
require('pg')
require('pry')
require('stylist')
require('client')

DB = PG.connect({ :dbname => 'salon_test' })

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *")
  end
end
