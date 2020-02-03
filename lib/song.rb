require 'pry'
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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
      else 
        self.find_by_name(name)
    end
  end

  def self.alphabetical
  @@all.sort_by {|obj| obj.name}  #sort arrays by any object attribute use sort_by and .attribute
  end

  def self.new_from_filename(file_name)
    song = self.new
    new_song = file_name.split(/ - /)
    artist = new_song[0]
    song_name = new_song[1].split(".")
    song.name = song_name[0]
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    song = self.new
    new_song = file_name.split(/ - /)
    artist = new_song[0]
    song_name = new_song[1].split(".")
    song.name = song_name[0]
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
  @@all = []
  end
  
end
