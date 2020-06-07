class BackgroundFacade
  def image(location)
    json = UnsplashService.new.get_image(location)

    image = json[:photos][:results][0][:urls][:raw]
    Image.new(image)
  end
end
