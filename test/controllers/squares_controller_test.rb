require 'test_helper'

class SquaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @square = squares(:one)
  end

  test "should get index" do
    get squares_url
    assert_response :success
  end

  test "should get new" do
    get new_square_url
    assert_response :success
  end

  test "should create square" do
    assert_difference('Square.count') do
      post squares_url, params: { square: { color: "red", school_id: 
      "1", square_description: "Desc", 
      square_id: "CT", square_type: 1} }
    end

    assert_redirected_to square_url(Square.last)
  end

  test "should not create square. Empty Desc" do
    assert_no_difference('Square.count') do
      post squares_url, params: { square: { color: "red", school_id: 
      "1", square_description: "", 
      square_id: "CT", square_type: 1} }
    end
  end

  test "should not create square wtih same id" do
    assert_no_difference('Square.count') do
      duplicate_item = @square.dup
      assert_not duplicate_item.valid?
    end
  end

  test "should show square" do
    get square_url(@square)
    assert_response :success
  end

  test "should get edit" do
    get edit_square_url(@square)
    assert_response :success
  end

  test "should update square" do
    patch square_url(@square), params: 
      { square: { color: "red", school_id: 
      "1", square_description: "Desc", 
      square_id: "CT", square_type: 1} }
  end

  test "should destroy square" do
    assert_difference('Square.count', -1) do
      delete square_url(@square)
    end

    assert_redirected_to squares_url
  end
end
