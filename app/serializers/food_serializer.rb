class FoodSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address
end
