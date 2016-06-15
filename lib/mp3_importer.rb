class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = []
    @files = Dir.entries(@path)
    @files = @files.map do |file|
      if file.include?(".mp3")
        file
      end
    end.compact
  end

  def import
    self.files.map do |file|
      Song.new_by_filename(file)
    end
  end

end