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
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name) || self.find_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_info(artist_name, song)
    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = song
    new_song
  end
  
  def self.song_info(info)
    data = info.split(/[-.]/)
    data.map {|info| info.strip}
  end
  
  def self.new_from_filename(info)
    array = self.song_info(info)
    artist_name = array[0]
    song = array[1]

    self.new_info(artist_name, song) 
  end

  def self.create_from_filename(info)
    new_song = self.new_from_filename(info)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
