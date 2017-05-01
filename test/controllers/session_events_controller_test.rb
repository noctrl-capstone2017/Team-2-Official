require 'test_helper'

class SessionEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session_event = session_events(:one)
  end

  test "should get index" do
    get session_events_url
    assert_response :success
  end

  test "should get new" do
    get new_session_event_url
    assert_response :success
  end

  test "should create session_event" do
    assert_difference('SessionEvent.count') do
      post session_events_url, params: { session_event: { behavior_square_id: @session_event.behavior_square_id, duration_end_time: @session_event.duration_end_time, session_id: @session_event.session_id, square_press_time: @session_event.square_press_time } }
    end

    assert_redirected_to session_event_url(SessionEvent.last)
  end

  test "should show session_event" do
    get session_event_url(@session_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_event_url(@session_event)
    assert_response :success
  end

  test "should update session_event" do
    patch session_event_url(@session_event), params: { session_event: { behavior_square_id: @session_event.behavior_square_id, duration_end_time: @session_event.duration_end_time, session_id: @session_event.session_id, square_press_time: @session_event.square_press_time } }
    assert_redirected_to session_event_url(@session_event)
  end

  test "should destroy session_event" do
    assert_difference('SessionEvent.count', -1) do
      delete session_event_url(@session_event)
    end

    assert_redirected_to session_events_url
  end
end
