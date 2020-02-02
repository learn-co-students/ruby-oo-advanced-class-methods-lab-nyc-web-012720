require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create 
    #creates and saves the song, returns the new song that was created
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    #returns an instance of song with its name property
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
      #creates a song instance with the argument passed in as the song name, saves it to the @@all array
      song = self.create
      song.name = song_name
      song
  end

  def self.find_by_name(song_name)
    #finds a song by its name, when it matches the argument passed in
    @@all.find do |song| song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    #finds a song, creates a new song instance if it doesnt exist
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    #sorts all tho song names alphabetically
    self.all.sort_by do |song| song.name
    end 
  end

  def self.new_from_filename(filename)
      data = filename.split(" - ")
      artist = data[0]
      name_mp3 = data[1]
      song_title = name_mp3.split(".")
      name = song_title[0]
      song = self.new
      song.name = name
      song.artist_name = artist
      song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    name_mp3 = data[1]
    song_title = name_mp3.split(".")
    name = song_title[0]
    song = self.create
    song.name = name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
