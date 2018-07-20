require_relative 'mp3_importer.rb'
require_relative 'artist.rb'
require 'pry'

class Song

#create songs for each filename
#send the artists's name (a string) to Artist class
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
  #parse a filename to get song name and artist name
  #create a new song instance using string from filename
  #associate new song with an artist - use a helper method artist_name=(artist_name) since we only have a string for the artist name (not an object)
  #return the new song instance
    song = Song.new(file_name.split(" - ")[1])
    song.artist = song.artist_name(file_name)
    song.assign_song_to_artist(song)
    song
  end

  def artist_name(file_name)
    #collaborates with Artist class
    #turn artist name as a string into an artist object
    #use Artist.find_or_create_by_name
    Artist.find_or_create_by_name(file_name.split(" - ")[0])
  end

  def assign_song_to_artist(song)
    #assign song to the artist
    #collaborate with Artist (add_song)
    song.artist.add_song(song)
  end
end
