module WeatherHelper
  require 'json'
  class WeatherUnderground
    include HTTParty
    def initialize(zip_code)
      @zip_code = zip_code
    end

    def api_key
      Rails.application.secrets.weather_underground_api_key
    end

    def build_url
      "http://api.wunderground.com/api/#{api_key}/conditions/forecast/q/#{@zip_code}.json"
    end

    def get_current_conditions
      @weather_data = ''
      request_string = build_url
      @weather_data = HTTParty.get(request_string).to_h
    end
  end
end
