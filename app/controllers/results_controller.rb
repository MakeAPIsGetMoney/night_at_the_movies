class ResultsController < ApplicationController
  def show
    @movie = MyFilm.new(params[:movie])
    @song = Music.new(genre: params[:genre], year: @movie.year)
  end

  def index
  end
end
