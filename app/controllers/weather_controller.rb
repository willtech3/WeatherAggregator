require 'json'
class WeatherController < ApplicationController
  before_filter :authenticate_user!
  include WeatherHelper
  def show
    zip = params[:zip]
    @user = User.find(current_user)
    @cities = City.all
    @wunderground = WeatherUnderground.new(zip)
    @weather_data = @wunderground.get_current_conditions
  end
end
