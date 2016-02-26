require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, format: :json, movie: "This is Spinal Tap", genre: "pop"
    assert_response :success
    assert response.body.include?("7/11")
  end

  test "should fail if not passed genre or movie" do
    get :show, format: :json
    assert response.body.include?("Please pass in both a movie and a music genre!")
    get :show, format: :json, movie:  "Titanic"
    assert response.body.include?("Please pass in both a movie and a music genre!")
    get :show, format: :json, genre: "pop"
    assert response.body.include?("Please pass in both a movie and a music genre!")
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
