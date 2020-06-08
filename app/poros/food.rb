class Food
  attr_reader :name,
              :address,
              :id

  def initialize(restaurant)
    @name = restaurant[:name]
    @address = restaurant[:location][:address]
  end
end
