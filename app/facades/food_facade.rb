class FoodFacade
  def restaurant(lat, lng, search)
    json = ZomatoService.new.get_restaurant(lat, lng, search)
    restaurant = json[:restaurants][0][:restaurant]
    Food.new(restaurant)
  end
end
