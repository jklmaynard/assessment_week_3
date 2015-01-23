class Client

  attr_reader(:name, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id});")

  end

  define_method(:==) do |another_client|
    self.name() == another_client.name() && self.stylist_id == another_client.stylist_id()
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE name = '#{self.name()}';")
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM clients")
    returned_clients = []
    results.each do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      returned_clients.push(Client.new({ :name => name, :stylist_id => stylist_id }))
    end
    returned_clients
  end
end
