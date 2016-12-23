class AlbumsController < ApplicationController

  def play
    album = RSpotify::Album.find(params[:spotify_id])
    @album_data = get_album_data(album)
  end

  def create
    @collection = Collection.find(params[:collection_id])
    spotify_object = RSpotify::Album.find(params[:spotify_id])
    @album = @collection.albums.new(spotify_id: spotify_object.id, art: spotify_object.images.first['url'], name: spotify_object.name, artist: spotify_object.artists.first.name, position: (@collection.albums.count + 1))
    @album.save
  end

  private

  def get_album_data(album)
    track_objects = album.tracks
    tracks = Hash.new
    tracks[:preview_urls] = track_objects.map(&:preview_url)
    tracks[:track_names] = track_objects.map(&:name)
    tracks[:track_artists] = track_objects.map{ |obj| obj.artists.map(&:name).to_sentence }
    {
      tracks: tracks,
      no_of_tracks: album.tracks.count,
      duration: 10000,
      album_name: album.name,
      album_art: album.images.first['url']
    }.to_json
  end

end