class Parcel
  attr_reader :id, :name
  @@parcels = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@parcles.values()
  end
  def save
    @@parcels[self.id] = Parcel.new(self.name, self.id)
  end

  def ==(parcel_to_compare)
    self.name() == parcel_to_compare.name()
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def update(name)
    @name=name
  end

  def self.find(id)
    @@albums[id]
  end

  def delete
    @@albums.delete(self.id)
  end
end
