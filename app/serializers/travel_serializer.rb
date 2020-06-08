class TravelSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :travel_time, :end_location
end
