class FoodSerializer
  include FastJsonapi::ObjectSerializer
  attributes :end_location, :travel_time, :summary, :temperature, :name, :address
end
