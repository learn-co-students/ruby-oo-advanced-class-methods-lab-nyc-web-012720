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

  def self.new_by_name(name) #custom class constructor
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
    self.all.find{|song| song.name == name} #find method locates and returns the first element
  end
   
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
      
  def self.alphabetical
    sorted = self.all.sort_by {|song|song.name}
  end
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    name_mp3 = data[1]
    data_name = name_mp3.split(".")
    name = data_name[0]
    song = self.new
    song.name = name
    song.artist_name = artist
    song  
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    name_mp3 = data[1]
    data_name = name_mp3.split(".")
    name = data_name[0]
    song = self.create
    song.name = name
    song.artist_name = artist
    song  
  end

  def self.destroy_all
    self.all.clear
  end
  
  


end
