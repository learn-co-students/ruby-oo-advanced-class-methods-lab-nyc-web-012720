class Song

  # 1. class var
  @@all = []

  # 2. attr_accessor
  attr_accessor :name, :artist_name
  # 3. attr_reader

  # 4. initializer
  

  def save
    self.class.all << self
  end

  # 6. class methods 
  # instantiates and saves the song, and it returns the new song that was created
  def self.create 
    song = Song.new 
    song.save 
    song
  end 

  # instantiates a song with a name property
  def self.new_by_name(name)
    song = Song.new  
    song.name = name
    song
  end 

  # instantiates and saves a song with a name property
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  # can find a song present in @@all by name
  # returns falsey when a song name is not present in @@all
  def self.find_by_name(name)
    @@all.find {|s| s.name == name }
  end 

  #   invokes .find_by_name and .create_by_name instead of repeating code
  #   returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  #   creates a new Song object with the provided title if one doesn't already exist
  def self.find_or_create_by_name(name)
    if !(self.find_by_name(name))
        self.create_by_name(name) 
    else 
      self.find_by_name(name)
    end 
  end 

  # .alphabetical
  # returns all the song instances in alphabetical order by song name
  def self.alphabetical
    # sorted = @@all.sort # Ascending sort
    # sorted = @@all.sort { |a, b| a <=> b } 
    self.all.sort_by{|s| s.name}
  end 

  # .new_from_filename
  # initializes a song and artist_name based on the filename format
  def self.new_from_filename (song_name)
    var = song_name.split("-")
    var_artist_name = var[0].strip
    var_song_name = var[1].split(".")
    var_song_name = var_song_name[0].strip 
    song = Song.new
    song.name = var_song_name
    song.artist_name = var_artist_name
    # song.save
    song 
    # other way 
          # parts = filename.split(" - ")
          # artist_name = parts[0]
          # song_name = parts[1].gsub(".mp3", "")

          # song = self.new
          # song.name = song_name
          # song.artist_name = artist_name
          # song


  end

  # .create_from_filename
  #   initializes and saves a song and artist_name based on the filename format
  def self.create_from_filename (file_name)
    var = file_name.split("-")
    var_artist_name = var[0].strip
    var_song_name = var[1].split(".")
    var_song_name = var_song_name[0].strip 
    song = Song.new
    song.name = var_song_name
    song.artist_name = var_artist_name
    song.save
    song 
    # short methode 
        # parts = filename.split(" - ")
        # artist_name = parts[0]
        # song_name = parts[1].gsub(".mp3", "")

        # song = self.create
        # song.name = song_name
        # song.artist_name = artist_name
        # song
  end 

  # .destroy_all
  #   clears all the song instances from the @@all array
  def self.destroy_all
    @@all.clear
    # or 
      # self.all.clear
  end 
  
  

  def self.all
    @@all
  end


end
