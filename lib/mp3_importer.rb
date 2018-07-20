require_relative 'song.rb'
require_relative 'artist.rb'

require 'pry'
class MP3Importer

#parse all the filenames in the db/mp3 folder
#send filenames to Song class
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #Google how to get a list of files in a directory
    #Only get .mp3 files
    Dir.entries(@path).select do |song|
      song.end_with?("mp3")
    end
  end

  def import
    binding.pry
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
