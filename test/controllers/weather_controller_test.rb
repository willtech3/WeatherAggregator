require 'test_helper'

class WeatherControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  #this controller is protected by devise so we have to stub out the user and sign_in
  let(:user) { User.create!(email: 'test@gmail.com', password: 'somepass', username: 'willtech') }

  before do
    sign_in user
  end

  #test 'should get show' do
  #  get(:show, { 'zip' => 33066 })
  #  assert_response :success
  #end

  #test 'show should render show view' do
  #  get(:show, {'zip' => 33066})
  #  assert_template :show
  #  assert_template(:layout => 'layouts/application')
  #end
end
