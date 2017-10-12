require 'test_helper'

class DiaryControllerTest < ActionDispatch::IntegrationTest
  test 'should get view' do
    get diary_view_url
    assert_response :success
  end

  test 'should get addgrade' do
    post diary_addgrade_url
    assert_response :success
  end

  test 'should get subjects' do
    get diary_subjects_url
    assert_response :success
  end
end
