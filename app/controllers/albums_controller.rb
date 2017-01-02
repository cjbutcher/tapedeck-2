class AlbumsController < ApplicationController

  def play
    album = RSpotify::Album.find(params[:spotify_id])
    @album_data = get_album_data(album)
  end

  def create
    @collection = current_user.collections.find(params[:collection_id])
    reject_request! unless @collection.user == current_user
    spotify_object = RSpotify::Album.find(params[:spotify_id])
    @album = @collection.albums.new(spotify_id: spotify_object.id, art: spotify_object.images.first['url'], name: spotify_object.name, artist: spotify_object.artists.first.name, year: get_release_year(spotify_object), position: (@collection.albums.count + 1))
    @album.save
  end

  def create_custom
    @collection = current_user.collections.find(params[:collection_id])
    reject_request! unless @collection.user == current_user
    @album = @collection.albums.new(custom: true, position: (@collection.albums.count + 1))
    @album.assign_attributes(custom_album_params)
    @album.save
    render :create
  end

  def destroy
    @album_id = params[:id]
    @album = current_user.albums.find(@album_id)
    reject_request! unless @album.collection.user == current_user
    @album.destroy
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
      duration: 10000,
      album_name: album.name,
      album_art: album.images.first['url']
    }.to_json
  end

  def get_release_year(album)
    if album.release_date_precision == "year"
      return album.release_date
    elsif album.release_date_precision == "month"
      d = "#{album.release_date}-01"
    elsif album.release_date_precision == "day"
      d = album.release_date
    end
    d.to_date.year
  end

  def custom_album_params
    params.require(:album).permit(:name, :artist, :year)
  end

end