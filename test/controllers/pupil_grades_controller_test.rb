require 'test_helper'

class PupilGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pupil_grade = pupil_grades(:one)
  end

  test "should get index" do
    get pupil_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_pupil_grade_url
    assert_response :success
  end

  test "should create pupil_grade" do
    assert_difference('PupilGrade.count') do
      post pupil_grades_url, params: { pupil_grade: {  } }
    end

    assert_redirected_to pupil_grade_url(PupilGrade.last)
  end

  test "should show pupil_grade" do
    get pupil_grade_url(@pupil_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_pupil_grade_url(@pupil_grade)
    assert_response :success
  end

  test "should update pupil_grade" do
    patch pupil_grade_url(@pupil_grade), params: { pupil_grade: {  } }
    assert_redirected_to pupil_grade_url(@pupil_grade)
  end

  test "should destroy pupil_grade" do
    assert_difference('PupilGrade.count', -1) do
      delete pupil_grade_url(@pupil_grade)
    end

    assert_redirected_to pupil_grades_url
  end
end
