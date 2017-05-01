require 'test_helper'

class RosterSquaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roster_square = roster_squares(:one)
  end

  test "should get index" do
    get roster_squares_url
    assert_response :success
  end

  test "should get new" do
    get new_roster_square_url
    assert_response :success
  end

  test "should create roster_square" do
    assert_difference('RosterSquare.count') do
      post roster_squares_url, params: { roster_square: { square_id: @roster_square.square_id, student_id: @roster_square.student_id } }
    end

    assert_redirected_to roster_square_url(RosterSquare.last)
  end

  test "should show roster_square" do
    get roster_square_url(@roster_square)
    assert_response :success
  end

  test "should get edit" do
    get edit_roster_square_url(@roster_square)
    assert_response :success
  end

  test "should update roster_square" do
    patch roster_square_url(@roster_square), params: { roster_square: { square_id: @roster_square.square_id, student_id: @roster_square.student_id } }
    assert_redirected_to roster_square_url(@roster_square)
  end

  test "should destroy roster_square" do
    assert_difference('RosterSquare.count', -1) do
      delete roster_square_url(@roster_square)
    end

    assert_redirected_to roster_squares_url
  end
end
