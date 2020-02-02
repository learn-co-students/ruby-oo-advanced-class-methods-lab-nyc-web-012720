class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create

    song = Song.new
    song.save
    song

  end

  def self.new_by_name(name)

    song = self.new
    song.name = name
    song

  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end


  def self.new_from_filename(filename)

    rows = filename.split(" - ")
    artist = rows[0]
    song_name = rows[1]
    file_name = song_name.split(".mp3")
    name = file_name[0]
    song = self.new
    song.name = name
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    rows = filename.split(" - ")
    artist = rows[0]
    song_name = rows[1]
    file_name = song_name.split(".mp3")
    name = file_name[0]
    song = self.create
    song.name = name
    song.artist_name = artist
    song
  end


  def self.destroy_all
    self.all.clear
  end

end
