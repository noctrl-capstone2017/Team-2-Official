# author: Kevin M
# Testing for the teachers model. Not much here right now, but there will be!
require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  setup do
    @teacher = teachers(:one)
  end
  
  test "should be valid" do
    assert @teacher.valid?
  end
  
end
