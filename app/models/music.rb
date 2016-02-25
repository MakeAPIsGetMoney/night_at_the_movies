class Music
  def initialize(genre: nil, year: nil)
    @music = HTTParty.get("https://api.spotify.com/v1/search?q=genre:#{genre}%20year:#{year}&type=track")
  end

  def full_list
    @music["tracks"]["items"]
  end

  def tracks
    @tracks = full_list.map { |t| t["name"] }
  end

  def most_popular
    sorted = full_list.sort_by {|t| t["popularity"]}
    sorted.reverse!
    @most_popular = sorted[0]
  end

  def popular_track_name
    most_popular["name"]
  end

  def popular_artist_name
    artists = most_popular["artist"]
    names = artists.each {|a| a["name"]}
  end


  # def track
  #   tracks = @track_listing.map do {|t| t["name"]}
  # end
  #
end
