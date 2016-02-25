require 'test_helper'
require "#{Rails.root}/app/models/imdb.rb"

class IMDB
  def initialize
    response = JSON.parse(File.read('./test/fixtures/mock_movie.json'))
    @success = response["success"]
    @title = response["result"]["title"]
    @year = response["result"]["year"]
    @director = response["result"]["director"]
    @actors = response["result"]["cast"]
    # @actors.each do |a|
    #   p a["actor"]
    # end
  end
end

class IMDBTest < ActiveSupport::TestCase
  test "retrieve data from imdb api" do
    movie = IMDB.new
    assert movie.success
  end

  test "get title year director and cast" do
    movie = IMDB.new
    assert_equal "This Is Spinal Tap", movie.title
    assert_equal 1984, movie.year
    assert_equal "Rob Reiner", movie.director
    assert_equal 15, movie.actors.length
  end

  test "get list of actors" do
    movie = IMDB.new
    assert_equal ["Rob Reiner", "Kimberly Stringer", "Chazz Dominguez", "Shari Hall",
        "R.J. Parnell", "David Kaff", "Tony Hendra", "Michael McKean", "Christopher Guest",
        "Harry Shearer", "Bruno Kirby", "Jean Cromie", "Patrick Maher", "Ed Begley Jr.",
        "Danny Kortchmar"],
        movie.get_actor_list
  end

  test "get actors role" do
    movie = IMDB.new
    assert_equal ["Marty DiBergi"], movie.get_actor_role("Rob Reiner")
  end
end
