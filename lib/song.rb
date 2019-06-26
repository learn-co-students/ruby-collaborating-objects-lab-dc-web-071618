class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    filename_data = filename.split(" - ")
    artist_name = filename_data[0]
    song_name = filename_data[1]

    new_song = Song.new(song_name)
    new_song.artist_name=(artist_name)
    new_song
  end
end
