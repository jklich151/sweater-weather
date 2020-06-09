class ZomatoService
  def conn
    Faraday.new(url: "https://developers.zomato.com") do |faraday|
      faraday.headers["user-key"] = ENV['ZOMATO_KEY']
    end
  end

  def get_restaurant(direction_data, search)
    response = conn.get("/api/v2.1/search?lat=#{direction_data[:lat]}&lon=#{direction_data[:lng]}&q=#{search}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
