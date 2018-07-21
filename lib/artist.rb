class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    if self.all.any? do |artist|
        artist.name == name
      end
      find_artist_by_name(name)
    else
      Artist.new(name)
    end
  end

  def self.find_artist_by_name(name)
    self.all.find do |artist|
      artist.name == name
    end
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end





# class Artist
#   attr_accessor :name
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     save
#   end
#
#   def songs
#     Song.all.select do |song|
#       song.artist == self
#     end
#   end
#
#   def self.all
#     @@all
#   end
#
#   def add_song(song)
#     song.artist = self
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.find_or_create_by_name(name)
#     artist_is_here = self.all.find do |artist|
#       artist.name == name
#       end
#       # binding.pry
#     if artist_is_here == nil
#       puts "it's nil"
#       new_variable = self.new(name)
#       puts new_variable.name
#     else
#       puts "found it"
#       artist_is_here
#     end
#   end
#
#   def print_songs
#     songs.each do |song|
#       puts song.name
#     end
#   end
# end
