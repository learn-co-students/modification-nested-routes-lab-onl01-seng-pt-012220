module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, nested)
    if Artist.exists?(song.artist_id) && nested 
      text_field_tag "artist_name", song.artist.name
    else
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    end
  end

end

