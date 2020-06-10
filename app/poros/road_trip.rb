class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :current_temp,
              :summary

  def initialize(origin, destination, weather)
    @id = "null"
    @origin = origin
    @destination = destination
    @weather = weather
  end

  def travel_time
    json = GoogleService.new.arrival_time(@origin, @destination)
    json[:routes][0][:legs][0][:duration][:text]
  end

  def current_temp
    @weather[:current][:temp]
  end

  def summary
    @weather[:current][:weather][0][:description]
  end
end
