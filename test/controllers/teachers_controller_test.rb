require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = users(:one)
  end

  test 'should get index' do
    sign_in User.create(:email => "#{rand(50000)}@example.com")
    get teachers_url
    assert_response :success
  end

end
