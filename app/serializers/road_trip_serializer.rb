class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :origin, :destination, :travel_time, :current_temp, :summary
end
