class Song
  attr_accessor :name, :artist_name
  @@all = []

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

  def self.create_by_name(song_name) #object
    song = self.create  #instatiates
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name} # find each song and matches
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) # OR operator
  end

  def self.alphabetical
    @@all.sort_by {|song_name| song_name.name }
  end

  def self.new_from_filename(filename)
    #filename = " "
    #return a new song instance
    #set song name to name song ""
    #set artisti name to name of artist ""
    #parse filename for song and artist name only
    #seperate artist name by -
    #remove .mp3 on song name
    info = filename.split(" - ")
    song = self.new #created a new song object
    song.name = info[1].chomp(".mp3")#remove .mp3 on song name
    song.artist_name = info[0] #set artisti name to name of artist ""
    song
  end

  def self.create_from_filename(filename)
    info = filename.split(" - ")
    song = self.create #created a new song object
    song.name = info[1].chomp(".mp3")#remove .mp3 on song name
    song.artist_name = info[0] #set artisti name to name of artist ""
    song
  end

  def self.destroy_all
    @@all.clear #empty array
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
