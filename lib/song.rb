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

  def self.new_by_name(name)
    song=self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song=self.create
    song.name=name
    song
  end


  def self.find_by_name(name)

    @@all.find{|title| title.name == name}

  end


  def self.find_or_create_by_name (name)
    # self.find_by_name(name) || self.create_by_name(name)

    if self.find_by_name(name) == nil
      song=self.create_by_name(name)
    else
      self.find_by_name(name)
    end
 
      # if  self.find_by_name(name)
      #   self.find_by_name(name)
      # else
      #   song=self.create_by_name(name)
      # end
  end

  def self.alphabetical
      self.all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(filename)
    song=self.new
    string=filename.gsub(".mp3","").split(" - ") #split on -
# binding.pry
    song.name=string[1]
    song.artist_name=string[0]
    song 
  end

  def self.create_from_filename(filename)
    song=self.create
    string=filename.gsub(".mp3","").split(" - ")
    song.name=string[1]
    song.artist_name=string[0]
    song
  end


  def self.destroy_all
    self.all.clear
  end

end
