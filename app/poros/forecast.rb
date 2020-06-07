class Forecast
  attr_reader :lat,
              :lng
  def initialize(results)
    @lat = results[:lat]
    @lng = results[:lng]
  end
end
