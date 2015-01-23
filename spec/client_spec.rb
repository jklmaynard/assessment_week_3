require('spec_buddy')

describe(Client) do

  describe("#name") do
    it("returns the name of a stylist") do
      client1 = Client.new({ :name => "Martha Jones", :stylist_id => 1 })
      expect(client1.name()).to eq("Martha Jones")
    end
  end

  describe("#save") do
    it("saves a client into an array") do
      client1 = Client.new({ :name => "Martha Jones", :stylist_id => 1 })
      client1.save()
      expect(Client.all()).to eq([client1])
    end
  end

  describe("#==") do
    it("identifies when two stylists are the same") do
      client1 = Client.new({ :name => "Martha Jones", :stylist_id => 1 })
      client1.save()
      client2 = Client.new({ :name => "Martha Jones", :stylist_id => 1 })
      expect(client1).to eq(client2)
    end
  end

  describe("#stylist_id") do
    it("lets you get the stylist id from the client") do
      client1 = Client.new({ :name => "Martha Jones", :stylist_id => 1 })
      expect(client1.stylist_id()).to eq(1)
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to eq([])
    end
  end

end
