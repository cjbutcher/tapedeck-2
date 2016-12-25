class SpotifyController < ApplicationController

  def search
    @collection = current_user.collections.find(params[:spotify][:collection_id])
    @albums = RSpotify::Album.search(params[:spotify][:query])
    @albums = @albums.reject{ |a| !a.is_a?(RSpotify::Album) }
    @albums = @albums.map{ |a| Album.new(spotify_id: a.id, art: a.images.first['url'], name: a.name, artist: a.artists.first.name) }
  end

end