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
    @@all << song
    song
  end

  def self.new_by_name (name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name (name)
    @@all.find {|i| i.name == name}
  end

  def self.find_or_create_by_name (title)
    self.find_by_name(title) ? self.find_by_name(title) : self.create_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by {|i| i.name}
  end

  def self.new_from_filename (filename)
    song = self.new
    split = filename.delete_suffix('.mp3').split(" - ")
    song.name = split[1]
    song.artist_name = split[0]
    song
  end

  def self.create_from_filename (filename)
    song = self.new
    split = filename.delete_suffix('.mp3').split(" - ")
    song.name = split[1]
    song.artist_name = split[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
