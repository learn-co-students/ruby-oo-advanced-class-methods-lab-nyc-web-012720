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
  def self.create 
    song = Song.new 
    song.save 
    song
  end 

  def self.new_by_name(name)
    song = Song.new  
    song.name = name
    song

  end 
  
  
  def self.all
    @@all
  end


end
