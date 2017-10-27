require 'test_helper'

class PupilsGradeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pupil = pupils(:one)
    @subject = subjects(:one)
  end

  test "should get index" do
    get pupil_subject_pupils_grade_index_path(@pupil, @subject)
    assert_response :success
  end

  test "should destroy pupil_grade" do
    assert_difference('PupilGrade.count', -1) do
      delete pupil_grade_url(@pupil_grade)
    end

    assert_redirected_to pupil_grades_url
  end
end
