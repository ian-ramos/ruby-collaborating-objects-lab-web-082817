class Song

  attr_accessor :name, :artist

  def initialize(name, artist = nil) #added on initialization because I want to have Artist.add_song run if there is an artist
    @name = name
    @artist = artist
    artist.add_song(self) if artist #you can create song with or without an artist, but you don't want this added to Artist class without an artist
  end

  def self.new_by_filename(file_name)
    song_name = file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    artist_instance = Artist.find_or_create_by_name(artist_name) #checking to see if artist already exists, if it doesn't, it'll create it.
    #Also, can't set new song artist = a string, which is what artist_name currently is
    Song.new(song_name, artist_instance)
  end

end
