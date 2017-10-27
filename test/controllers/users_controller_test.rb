require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    post user_session_path(user: 'admin@admin', password: 'zaq12wsx')
    @user = users(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user), params: { user: { firstname: 'admin', lastname: 'admin', email: 'admin@admin', role: 'admin' } }
    assert_redirected_to users_url
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
