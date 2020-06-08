class ZomatoService
  def get_restaurant(lat, lng, search)
    response = conn.get("/api/v2.1/search?lat=#{lat}&lon=#{lng}&q=#{search}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developers.zomato.com") do |faraday|
      faraday.headers["user-key"] = ENV['ZOMATO_KEY']
    end
  end
end
