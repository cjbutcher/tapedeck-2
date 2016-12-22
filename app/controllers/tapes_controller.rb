class TapesController < ApplicationController

 def play
    #@tape = Tape.find(params[:id])
    #album = RSpotify::Album.find(@tape.album_id)
    album = RSpotify::Album.find(params[:id])
    puts album.inspect
    track_objects = album.tracks
    tracks = { preview_urls: [], track_names: [], track_artists: [] }
    track_objects.each do |track_object|
      tracks[:preview_urls] << track_object.preview_url
      tracks[:track_names] << track_object.name
      track_artist_names = track_object.artists.map{ |a| a.name }
    end
    @album_data = {
      tracks: tracks,
      no_of_tracks: album.tracks.count,
      duration: 10000,
      album_name: album.name
    }.to_json
  end

end