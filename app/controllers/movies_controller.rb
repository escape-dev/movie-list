class MoviesController < ApplicationController
  def index 
    @popular = TmdbApi.movie("popular")[0..9]
    @upcoming = TmdbApi.movie("upcoming")[0..9]
    @top_rated = TmdbApi.movie("top_rated")[0..9]
    @now_playing = TmdbApi.movie("now_playing")[0..9]
  end
end
