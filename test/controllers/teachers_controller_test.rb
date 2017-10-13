require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @teacher = users(:one)
  end

  test 'should get index' do
    get teachers_url
    assert_response :success
  end

end
