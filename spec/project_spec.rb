require('rspec')
require('project')

describe '#Parcel' do

  before(:each)do
  Parcel.clear()
  end

  describe("#save") do
    it('saves a parcel')do
    parcel = Parcel.new("Box1", nil, 10, 5, 3, 10, 100) # nil added as second argument
    parcel.save()
    parcel2 = Parcel.new("Box2", nil, 12, 3, 4, 15, 100) # nil added as second argument
    parcel2.save()
    expect(Parcel.all).to(eq([parcel, parcel2]))
  end
end

  describe ('.all') do
    it("is empty")do
    expect(Parcel.all()).to(eq([]))
  end
end


describe('.clear') do
    it("clears all parcels") do
      parcel = Parcel.new("Box1", nil, 10, 5, 3, 10, 100)
      parcel.save()
      parcel2 = Parcel.new("Box2", nil, 12, 3, 4, 15, 100)
      parcel2.save()
      Parcel.clear()
      expect(Parcel.all).to(eq([]))
    end
  end


  describe('#update') do
    it("updates an parcel by id") do
      parcel = Parcel.new("Box1", nil, 10, 5, 3, 10, 100)
      parcel.update("A Love Supreme")
      expect(parcel.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
      it("deletes a parcel by id") do
        parcel = Parcel.new("Box1", nil, 10, 5, 3, 10, 100)
        parcel.save()
        parcel2 = Parcel.new("Box2", nil, 12, 3, 4, 15, 100)
        parcel2.save()
        parcel.delete()
        expect(Parcel.all).to(eq([parcel2]))
      end
    end
  describe('#==') do
    it("is the same parcel if it has the same attributes as another parcel") do
      parcel = Parcel.new("Box1", nil, 10, 5, 3, 10, 100)
      parcel.save()
      parcel2 = Parcel.new("Box1", nil, 10, 5, 3, 10, 100)
      parcel2.save()
      expect(parcel).to(eq(parcel2))
    end
  end
    describe('#vol') do
      it("should calculate volume") do
        parcel = Parcel.new("Box1", nil, 10, 5, 3, 10, 100)
        parcel.save()
        expect(parcel.vol).to(eq(150))
      end
  end
  describe('#cost') do
    it("should calculate cost") do
      parcel = Parcel.new("Box1", nil, 10, 5, 3, 10, 100)
      parcel.save()
      expect(parcel.cost).to(eq(17.5))
    end
  end
end
