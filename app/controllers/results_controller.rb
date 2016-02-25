class ResultsController < ApplicationController
  def show
    #params should be passed in like so: genre="pop"&year=2016
    #Will need to add some graceful error handling, or a fall back, if no results are found.
    song = Music.new(genre: params[:genre], year: params[:year])
    render json: song
  end

  def index
  end
end
