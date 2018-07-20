require 'pry'
require_relative 'song.rb'
require_relative 'mp3_importer.rb'

class Artist
#useful to create helper methods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  # def songs
  #   #return all songs that belong to an artist
  #   Song.all.select do |song|
  #     song.artist == self
  #   end
  # end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.get_artist_names
    Artist.all.map do |artist|
      artist.name
    end
  end

  def self.get_artist_by_name(artist_name)
    Artist.all.find do |artist|
      artist.name == artist_name
    end
  end

  def self.find_or_create_by_name(artist_name)
    #takes in artist's name (a string)
    #either the artist instance has the name or creates it
    #return value withh be an instance of an artist with the name attribute filled out
    if self.get_artist_names.include?(artist_name)
      self.get_artist_by_name(artist_name)
    else
      artist = self.new(artist_name)
      artist.name = artist_name
      artist
    end
  end

  def add_song(song)
    @songs << song
    #tells the artist about its songs
    #take Song instance (argument) and store in songs array for the artistlearn
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end
