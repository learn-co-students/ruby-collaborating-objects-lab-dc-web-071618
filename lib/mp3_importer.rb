require 'pry'
require_relative './artist.rb'
require_relative './song.rb'

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select do |filename|
      filename.end_with?('mp3')
    end
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
end

# test_music_path = "./spec/fixtures/mp3s"
# music_importer = MP3Importer.new(test_music_path)
# music_files = music_importer.files
#
# binding.pry
# 'hi'


# require 'pry'
#
# class MP3Importer
#   attr_accessor :path
#
#   def initialize(path)
#     @path = path
#   end
#
#   def files
#     Dir.entries("#{@path}").select {|f| !File.directory? f}
#   end
#
#   def import
#     files.each do |filename|
#       Artist.find_or_create_by_name(Song.new_by_filename(filename))
#       # binding.pry
#     end
#     # binding.pry
#   end
# end
