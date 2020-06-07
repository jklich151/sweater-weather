class UnsplashService

  def get_image(location)
    response = conn.get("/search?query=#{location}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV["IMAGE_KEY"]
    end
  end
end
