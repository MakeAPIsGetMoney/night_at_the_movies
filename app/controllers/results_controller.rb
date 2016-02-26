class ResultsController < ApplicationController
  def show
    #params should be passed in like so: genre="pop"&year=2016
    movie = IMDB.new(movie: params[:movie])
    song = Music.new(genre: params[:genre], year: movie.year)
    render json: song
  end

  def index
  end
end
