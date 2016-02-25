class Music
  def initialize(genre: nil, year: nil)
    params = "genre:#{genre} year:#{year}"
    @music = HTTParty.get("https://api.spotify.com/v1/search?q=#{params}&type=track")
  end

  def as_json(options)
    {
      artists: popular_artist,
      track_name: popular_track,
      album_name: popular_album
    }

  end

  def full_list
    @music["tracks"]["items"]
  end

  def tracks
    tracks = full_list.map { |t| t["name"] }
  end

  def most_popular
    sorted = full_list.sort_by {|t| t["popularity"]}
    sorted.reverse!
    sorted[0]
  end

  def popular_track
    most_popular["name"]
  end

  def popular_artist
    artists = most_popular["artists"]
    names = []
    artists.each {|a| names << a["name"] }
    names
  end

  def popular_album
    most_popular["album"]["name"]
  end

end
