require_relative 'song'
require_relative 'artist'
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*"].map{|x| x.split('/').last}
  end

  def import
    files = self.files
    files.each do |file|
      split_file = file.split(' - ')
      new_artist = Artist.find_or_create_by_name(split_file[0])
      new_artist.add_song(split_file[1])
    end
  end
    # binding.pry


end
