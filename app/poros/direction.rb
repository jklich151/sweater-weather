class Direction
  attr_reader :travel_time,
              :end_location

  def initialize(travel_info)
    @travel_time = travel_info[:duration][:text]
    @end_location = travel_info[:end_address]
  end
end
