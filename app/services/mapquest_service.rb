class MapquestService

  def initialize(from, to)
    @from = from
    @to = to
  end

  def get_distance
    json = JSON.parse(conn.body, symbolize_names: true)
    json[:route][:distance]
  end

  def conn
    Faraday.get("http://www.mapquestapi.com/directions/v2/route") do |faraday|
      faraday.params["key"] = ENV['MAPQUEST_KEY']
      faraday.params["from"] = @from
      faraday.params["to"] = @to
    end
  end
end
