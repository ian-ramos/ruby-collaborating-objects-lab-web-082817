class Artist

  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(artist)
    check = @@all.find do |instance|
      instance.name == artist
    end
    if check
      artist = check
    else
      self.new(artist)
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
