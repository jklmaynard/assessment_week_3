require('spec_buddy')

describe(Stylist) do

  describe("#name") do
    it("returns the name of a stylist") do
      stylist1 = Stylist.new({ :name => "Barbara", :id => nil })
      expect(stylist1.name()).to eq("Barbara")
    end
  end

  describe("#id") do
    it("returns the id of the stylist") do
      stylist1 = Stylist.new({ :name => "Barbara", :id => nil })
      stylist1.save()
      expect(stylist1.id()).to be_an_instance_of(Fixnum)
    end
  end

  describe("#save") do
    it("saves a stylist into an array") do
      stylist1 = Stylist.new({ :name => "Barbara", :id => nil })
      stylist1.save()
      expect(Stylist.all()).to eq([stylist1])
    end
  end

  describe("#==") do
    it("identifies when two stylists are the same") do
      stylist1 = Stylist.new({ :name => "Barbara", :id => nil })
      stylist1.save()
      stylist2 = Stylist.new({ :name => "Barbara", :id => nil })
      expect(stylist1).to eq(stylist2)
    end
  end

  describe("#clients") do
    it("returns an array of clients for that particular stylist") do
      stylist1 = Stylist.new({ :name => "Joe Sammy", :id => nil })
      stylist1.save()
      client1 = Client.new({ :name => "Martha Jones", :stylist_id => stylist1.id() })
      client1.save()
      client2 = Client.new({ :name => "Donna Noble", :stylist_id => stylist1.id() })
      client2.save()
      expect(stylist1.clients()).to eq([client1, client2])
    end
  end

  describe("#delete") do
    it("deletes stylist from the database") do
      stylist1 = Stylist.new({ :name => "Joe Sammy", :id => nil })
      stylist1.save()
      stylist2 = Stylist.new({ :name => "Barbara Bernstein", :id => nil })
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to eq([stylist2])
    end

    it("deletes a stylist's clients from the database") do
      stylist1 = Stylist.new({ :name => "Joe Sammy", :id => nil })
      stylist1.save()
      client1 = Client.new({ :name => "Martha Jones", :stylist_id => stylist1.id() })
      client1.save()
      client2 = Client.new({ :name => "Donna Noble", :stylist_id => stylist1.id() })
      client2.save()
      stylist1.delete()
      expect(Client.all()).to eq([])
    end
  end

  describe(".find") do
    it("returns the stylist by an ID number") do
      stylist1 = Stylist.new({ :name => "Barbara", :id => nil })
      stylist1.save()
      stylist2 = Stylist.new({ :name => "Sam", :id => nil })
      stylist2.save()
      expect(Stylist.find(stylist2.id())).to eq(stylist2)
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to eq([])
    end
  end

end
