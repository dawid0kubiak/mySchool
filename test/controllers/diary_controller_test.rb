require 'test_helper'

class DiaryControllerTest < ActionDispatch::IntegrationTest

  setup do
    @subject = subjects(:one)
    @pupil = pupils(:one)
    @grade = grades(:one)
  end

  test 'should get view' do
    get diary_view_url, params: {subject_id: @subject.id}
    assert_response :success
  end

  test 'should get addgrade' do
    assert_difference('@pupil.pupils_grades.count') do
      post diary_addgrade_url, params: {subject: {subject_id: @subject.id, pupil_id: @pupil.id, grade_id: @grade.id}}
    end
    assert_redirected_to diary_view_url
  end

  test 'should get subjects' do
    get diary_subjects_url
    assert_response :success
  end
end
