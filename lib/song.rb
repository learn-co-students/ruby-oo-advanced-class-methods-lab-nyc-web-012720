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
    result = nil
      @@all.each do |finder|
         if finder.name == name
          return result = finder
         end
      end
      result
    end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    result = []
    result2 = []

    self.all.each do |finder|
      result << finder.name 
    end
    result = result.sort
    i = 0
    while i < result.length
      result2 << self.find_by_name(result[i])
      i += 1
  end
  result2
end

  def self.new_from_filename(filename)
    song = self.new
    delimiters = [" - ", "."]
    song_name_split = filename.split(Regexp.union(delimiters))
    name = song_name_split[1]
    song.name = name
    artist_name = song_name_split[0]
    song.artist_name = artist_name
    
    song
  end

  def self.create_from_filename(filename)
    song_match = self.new
   
    file_list = self.new_from_filename(filename)
  
    song_match.name = file_list.name
    song_match.artist_name = file_list.artist_name
    
    @@all << song_match
     song_match  
  end

  def self.destroy_all
    self.all.clear
  end
end
