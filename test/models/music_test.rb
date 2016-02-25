require 'test_helper'
require "#{Rails.root}/app/models/music.rb"

class Music
 def initialize
   @music = JSON.parse(File.read("./test/fixtures/mock_music.json"))
 end

end


class VoteTest < ActiveSupport::TestCase
  test "Can get API results" do
   m = Music.new
   assert m
  end

  test "can pass in genre and year" do
   m = Music.new
   assert_equal "Just Give Me a Reason", m.tracks[0]
  end

  test "can get most popular track" do
    m = Music.new
    assert_equal "7/11", m.popular_track
  end

  test "can get most popular artist" do
    m = Music.new
    assert_equal ["Beyoncé"], m.popular_artist
  end

  test "can get most popular album" do
    m = Music.new
    assert_equal "BEYONCÉ [Platinum Edition]", m.popular_album
  end

end
