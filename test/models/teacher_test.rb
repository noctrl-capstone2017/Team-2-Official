# author: Kevin M
# Testing for the teachers model. Not much here right now, but there will be!
require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @teacher = Teacher.new(user_name: "Example Teacher", teacher_password: "df")
  end

  test "should be valid" do
    assert @teacher.valid?
  end

  # Steven Royster: Makes sure that a password of length 5 (less than the set minimum which is 6) is invalid
  # Inspired by Michael Hartl in his sample_app tutorial
  test "password should have a minimum length" do
    @teacher.teacher_password = @teacher.teacher_password_confirmation = "a" * 5
    assert_not @teacher.valid?
  end
end
