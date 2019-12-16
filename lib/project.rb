class Parcel
  attr_reader :id, :name, :width, :height, :length, :weight, :distance
  @@parcels = {}
  @@total_rows = 0

  def initialize(name, id, width, height, length, weight, distance)
    @name = name
    @id = id || @@total_rows += 1
    @width = width.to_i
    @height = height.to_i
    @length = length.to_i
    @weight = weight.to_i
    @distance = distance.to_i
  end

  def self.all
    @@parcels.values()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.name, self.id, self.width, self.height, self.length, self.weight, self.distance)
  end

  def ==(parcel_to_compare)
    self.name() == parcel_to_compare.name()
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def update(id)
    @name=id
  end

  def self.find(id)
    @@parcels[id]
  end

  def delete
    @@parcels.delete(self.id)
  end

  def vol
    @height * @length * @width
  end

  def cost
    (@weight * 0.75 ) + (@distance * 0.10)
  end

end
