require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, format: :json, movie: "This is Spinal Tap", genre: "pop"
    assert_response :success
    assert response.body.include?("7/11")
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
