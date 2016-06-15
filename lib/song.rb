require_relative 'artist.rb'
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_array = filename.gsub(".mp3", "").split(" - ")
    song = Song.new(song_array[1])
    song.artist = Artist.find_or_create_by_name(song_array[0])
    song.artist.songs << song
    song
  end

end
