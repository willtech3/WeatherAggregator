require 'test_helper'
class WeatherHelperTest < ActiveSupport::TestCase
  include WeatherHelper
  before do
    @weather_underground = WeatherUnderground.new(33066)
    VCR.use_cassette('conditions') do
    	@data = @weather_underground.get_current_conditions
    end
  end

  test 'attempting to access zip code throws NoMethodError' do
    assert_raises(NoMethodError) { @weather_underground.zip_code }
  end

  test 'api key should equal value returned by rails' do
    assert_equal Rails.application.secrets.weather_underground_api_key, @weather_underground.api_key
  end

  test 'weather helper must include HTTParty' do
    WeatherHelper::WeatherUnderground.must_include HTTParty
  end

  test 'testurl should equal value returned by build_url' do
    test_url = "http://api.wunderground.com/api/f65a04930f6ac54c/conditions/forecast/q/33066.json"
    assert_equal(test_url, @weather_underground.build_url)
  end

  test 'get current conditions should not make real api call' do
    VCR.use_cassette('conditions') do
       assert_not_equal Hash.new, @data
    end
  end

  test 'get current conditions should return a hash of data' do
    VCR.use_cassette('conditions') do 
      assert_kind_of Hash, @data 
    end
  end
  test 'data should contain current_observation' do
    assert_not_nil @data['current_observation']
  end

  test 'data should contain current_observation image url' do

  end

  test 'data should contain forecast' do
    assert_not_nil @data['forecast']
  end
end


