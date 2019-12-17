class Parcel
  attr_reader :id
  attr_accessor :name, :width, :height, :length, :weight, :distance
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

  def update_name(name)
    @name=name
  end

  def update_width(width)
    @width=width
  end

  def update_height(height)
    @height=height
  end

  def update_length(length)
    @length=length
  end
def update_weight(weight)
  @weight = weight.to_i
end

def update_distance(distance)
  @distance = distance.to_i
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

  def regular_cost
    (@weight * 0.75 ) + (@distance * 0.10)
  end

  def express_cost()
    self.regular_cost * 2
  end

  def surface_area
    2*((@width*@length)+ (@height*@length) + (@width*@height))
  end

  def gift_wrap
    (0.05 * self.surface_area).round
  end
end
