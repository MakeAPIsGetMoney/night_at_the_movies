json.success @movie.success
json.results do
  json.movie do
    json.title @movie.title
    json.year @movie.year
    json.directors @movie.directors do |d|
      json.name d["name"]
    end
    json.actors @movie.actors do |a|
      json.name a["actorName"]
      json.role a["character"]
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
