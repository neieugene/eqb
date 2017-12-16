require 'test_helper'

class LabQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_queue = lab_queues(:one)
  end

  test "should get index" do
    get lab_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_queue_url
    assert_response :success
  end

  test "should create lab_queue" do
    assert_difference('LabQueue.count') do
      post lab_queues_url, params: { lab_queue: { date: @lab_queue.date, name: @lab_queue.name } }
    end

    assert_redirected_to lab_queue_url(LabQueue.last)
  end

  test "should show lab_queue" do
    get lab_queue_url(@lab_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_queue_url(@lab_queue)
    assert_response :success
  end

  test "should update lab_queue" do
    patch lab_queue_url(@lab_queue), params: { lab_queue: { date: @lab_queue.date, name: @lab_queue.name } }
    assert_redirected_to lab_queue_url(@lab_queue)
  end

  test "should destroy lab_queue" do
    assert_difference('LabQueue.count', -1) do
      delete lab_queue_url(@lab_queue)
    end

    assert_redirected_to lab_queues_url
  end
end
