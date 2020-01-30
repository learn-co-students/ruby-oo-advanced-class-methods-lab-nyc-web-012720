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
    new_song = self.new 
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    Song.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else 
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    song_data = file.split(/[-.]/)
    new_song = self.new
    new_song.name = song_data[1].strip
    new_song.artist_name = song_data[0].strip
    new_song
  end

  def self.create_from_filename(file)
    song_data = file.split(/[-.]/)
    new_song = self.new
    new_song.name = song_data[1].strip
    new_song.artist_name = song_data[0].strip
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
