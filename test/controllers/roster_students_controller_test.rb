require 'test_helper'

class RosterStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roster_student = roster_students(:one)
  end

  test "should get index" do
    get roster_students_url
    assert_response :success
  end

  test "should get new" do
    get new_roster_student_url
    assert_response :success
  end

  test "should create roster_student" do
    assert_difference('RosterStudent.count', 1) do
      post roster_students_url, params: { roster_student: { student_id: @roster_student.student_id, teacher_id: @roster_student.teacher_id } }
    end

    assert_redirected_to roster_student_url(RosterStudent.last)
  end

  test "should show roster_student" do
    get roster_student_url(@roster_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_roster_student_url(@roster_student)
    assert_response :success
  end

  test "should update roster_student" do
    patch roster_student_url(@roster_student), params: { roster_student: { student_id: @roster_student.student_id, teacher_id: @roster_student.teacher_id } }
    assert_redirected_to roster_student_url(@roster_student)
  end

  test "should destroy roster_student" do
    assert_difference('RosterStudent.count', -1) do
      delete roster_student_url(@roster_student)
    end

    assert_redirected_to roster_students_url
  end
end
