class MP3Importer

  attr_accessor :path, :size

  def initialize(path)
    @path = path
  end

  def files
    array = Dir.entries(@path) #Dir is a class (included in Ruby), entries will take all the entries in the path and puts file names in an array
    array.select do |filename|
      filename.include?(".mp3") #there are hidden files, you only want the mp3
    end
  end

  def import
    self.files.map do |file|
      Song.new_by_filename(file)
    end
  end

end
