class GoogleService

  def coordinates(location)
    response = conn.get("/maps/api/geocode/json?address=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_KEY"]
    end
  end
end
