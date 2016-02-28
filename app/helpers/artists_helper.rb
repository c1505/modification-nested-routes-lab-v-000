module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artists)
    if song.artist.nil? #shouldn't this be looking at params?  did not set this in the controller yet
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    else
      hidden_field_tag "song[artist_id]", song.artist_id
    end
    #only display artist name if they are editing through a nested route
    #else display a select box.  
    #need the collection of artists
    # binding.pry
  end
end
