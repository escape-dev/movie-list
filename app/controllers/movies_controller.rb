class MoviesController < ApplicationController
  def index 
    @movies = TmdbApi.now_playing
  end
end
