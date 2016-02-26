class ResultsController < ApplicationController
  def show
    #params should be passed in like so: year=2016&genre="pop"
    @movie = MyAPIFilm.new(params[:movie])
    @song = Music.new(genre: params[:genre], year: @movie.year)
  end

  def index
  end
end
