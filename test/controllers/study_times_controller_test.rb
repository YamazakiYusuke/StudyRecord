require 'test_helper'

class StudyTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_time = study_times(:one)
  end

  test "should get index" do
    get study_times_url
    assert_response :success
  end

  test "should get new" do
    get new_study_time_url
    assert_response :success
  end

  test "should create study_time" do
    assert_difference('StudyTime.count') do
      post study_times_url, params: { study_time: { date: @study_time.date, end: @study_time.end, comment: @study_time.comment, start: @study_time.start, time_length: @study_time.time_length } }
    end

    assert_redirected_to study_time_url(StudyTime.last)
  end

  test "should show study_time" do
    get study_time_url(@study_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_time_url(@study_time)
    assert_response :success
  end

  test "should update study_time" do
    patch study_time_url(@study_time), params: { study_time: { date: @study_time.date, end: @study_time.end, comment: @study_time.comment, start: @study_time.start, time_length: @study_time.time_length } }
    assert_redirected_to study_time_url(@study_time)
  end

  test "should destroy study_time" do
    assert_difference('StudyTime.count', -1) do
      delete study_time_url(@study_time)
    end

    assert_redirected_to study_times_url
  end
end
