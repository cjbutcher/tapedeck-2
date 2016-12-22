class SpotifyController < ApplicationController

  def index

  end

  def search
    @albums = RSpotify::Album.search(params[:spotify][:query])
    @albums = @albums.reject{ |a| !a.is_a?(RSpotify::Album) }
  end

end