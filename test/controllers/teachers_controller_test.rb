# author: Kevin M
# Testing for the teachers controller. The first two are just scaffold tests,
#  the rest are mine.
require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = teachers(:one)
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post teachers_url, params: { teacher: { admin_powers: @teacher.admin_powers, analysis_powers: @teacher.analysis_powers, color: @teacher.color, school_id: @teacher.school_id, teacher_description: @teacher.teacher_description, teacher_email: "email@example.com", teacher_icon_name: @teacher.teacher_icon_name, teacher_name: @teacher.teacher_name, user_name: @teacher.user_name } }
    end
    assert_redirected_to teacher_url(Teacher.last)
  end

  test "should show teacher" do
    get teacher_url(@teacher)
    assert_response :success
  end
  
  test "should reject invalid email" do
    assert_no_difference('Teacher.count') do
      post teachers_url, params: { teacher: { admin_powers: @teacher.admin_powers, analysis_powers: @teacher.analysis_powers, color: @teacher.color, school_id: @teacher.school_id, teacher_description: @teacher.teacher_description, teacher_email: @teacher.teacher_email, teacher_icon_name: @teacher.teacher_icon_name, teacher_name: @teacher.teacher_name, user_name: @teacher.user_name } }
    end
  end
end
