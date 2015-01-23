class Client

  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name() == another_client.name()
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM clients")
    returned_clients = []
    results.each do |client|
      name = client.fetch("name")
      id = client.fetch("id")
      returned_clients.push(Client.new({ :name => name, :id => id }))
    end
    returned_clients
  end
end
