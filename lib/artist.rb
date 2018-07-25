class Artist
  @@all = []
  attr_accessor :name, :songs
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

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find{|artist| artist.name == name}
    if artist
      return artist
    else
      self.new(name)
    end
  end

  def print_songs
    @songs.each do |song| puts song.name end
  end
end
