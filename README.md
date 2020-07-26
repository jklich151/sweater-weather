# README

## Weather Forecasting API

This is a RESTful API that manages endpoints that provide detailed weather forecasts based on location as well as predictive information based on travel plans based around trip time.

## Setup

To explore the API and what it can offer locally:

1. Clone down the repo
2. In the directory run `bundle install`, `rake db:{create,migrate}`, `figaro install`
3. Aquire the required API keys and apply them to the `application.yml` in the config directory:
  * Open Weather One
  * Geocoding and Directions from Google Maps
  * Unsplash
4. Run `rails s`

## Endpoints

### Forecast

`GET /api/v1/forecast` with parameters of `location=CITY_NAME`.

The detailed response will include JSON API standard formatted information regarding the current weather for the location, as well as 8 hours of hourly information, and 7 days worth of forecasted weather. All timecodes are in UNIX.

### Current Response

``` 
"id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "dt": 1587566460,
                "sunrise": 1587556535,
                "sunset": 1587603764,
                "temp": 71.62,
                "feels_like": 74.3,
                "humidity": 88,
                "uvi": 7.98,
                "visibility": 2816,
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    },
                    {
                        "id": 701,
                        "main": "Mist",
                        "description": "mist",
                        "icon": "50d"
                    }
                ],
                "min": 71.33,
                "max": 85.12
            }
```

