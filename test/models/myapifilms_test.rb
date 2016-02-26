require 'test_helper'
require "#{Rails.root}/app/models/myapifilms.rb"

class MyAPIFilm
  def initialize(movie)
    response = JSON.parse(File.read('./test/fixtures/mock_movie2_electric_boogaloo.json'))
    @success = !(response["data"]["movies"].empty?)
    @title = response["data"]["movies"][0]["title"]
    @year = response["data"]["movies"][0]["year"].to_i
    @directors = response["data"]["movies"][0]["directors"]
    @writers = response["data"]["movies"][0]["writers"]
    @actors = response["data"]["movies"][0]["actors"]
    @runtime = response["data"]["movies"][0]["runtime"][0]
  end
end

class MyAPIFilmsTest < ActiveSupport::TestCase
  test "retrieve data from api" do
    movie = MyAPIFilms.new("This is spinal tap")
    assert movie.success
  end

  test "single item data returned is parsed correctly" do
    movie = MyAPIFilms.new("This is spinal tap")
    assert_equal "This Is Spinal Tap", movie.title
    assert_equal 1984, movie.year
    assert_equal "82 min", movie.runtime
  end

  test "multi item data returned is parsed correctly" do
    movie = MyAPIFilms.new("This is spinal tap")
    assert_equal "Rob Reiner", movie.directors[0]["name"]
    assert_equal "Christopher Guest", movie.writers[0]["name"]
    assert_equal "Michael McKean", movie.writers[1]["name"]
    assert_equal 15, movie.actors.length
  end

  test "get array of directors" do
    movie = MyAPIFilms.new("This is spinal tap")
    assert_equal ["Rob Reiner"], movie.get_directors_list
  end

  test "get array of actors names" do
    movie = MyAPIFilms.new("This is spinal tap")
    actors = movie.get_actors_name_list
    assert_equal 15, actors.length
    assert_equal "Kimberly Stringer", actors[1]
  end

  test "get array of writers names" do
    movie = MyAPIFilms.new("This is spinal tap")
    assert_equal "Christopher Guest", movie.get_writers_list[0]
  end
end
