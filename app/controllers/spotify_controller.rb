class SpotifyController < ApplicationController

  def search
    @collection = current_user.collections.find(params[:collection_id])
    @albums = RSpotify::Album.search(spotify_params.values.first)
    @albums = @albums.reject{ |a| !a.is_a?(RSpotify::Album) }
    @albums = @albums.map{ |a| Album.new(spotify_id: a.id, art: a.images.first['url'], name: a.name, artist: a.artists.first.name) }
  end

  private

  def spotify_params
    params.require(:spotify).permit(:query)
  end

end