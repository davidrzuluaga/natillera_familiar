require 'test_helper'

class NatilleraControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get natillera_index_url
    assert_response :success
  end

end
