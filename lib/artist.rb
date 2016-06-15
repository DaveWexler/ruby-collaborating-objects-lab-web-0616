require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
    @song = song
  end

  def self.all
    @@all.uniq
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(name)
    correct = self.all.find {|artist| artist.name == name}
    correct ||= Artist.new(name)
  end


end