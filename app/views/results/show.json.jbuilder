json.success @movie.success
json.results do
  json.movie do
    json.title @movie.title
    json.year @movie.year
    json.director @movie.director
    json.actors @movie.actors do |a|
      json.name a["actor"]
      json.role a["role"]
    end
  end
  json.song do
    json.artists @song.popular_artist do |a|
      json.name a
    end
    json.song @song.popular_track
    json.album @song.popular_album
  end
end
