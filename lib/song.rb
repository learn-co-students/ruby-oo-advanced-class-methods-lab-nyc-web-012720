class Song

  attr_accessor :name, :artist_name
  @@all = []  
  
  def self.create()
  	x = Song.new()
  	@@all << x
  	  return x
  end  
    
  def self.new_by_name(name)
  	x = Song.new()
  	x.name = name
      return x
  end  
  
  def self.all
    @@all
  end  
  
  def self.create_by_name(name)
  	x = Song.new()
  	x.name = name
  	@@all << x
  	  return x
  end  

  def self.find_by_name(name)
  	return @@all.find {|elements| elements.name == name}
  end  
  
  def self.find_or_create_by_name(name)
  	Song.find_by_name(name) ? Song.find_by_name(name) : Song.create_by_name(name)
  end  
  
  def self.alphabetical
  	@@all.sort! { |a, b| a.name <=> b.name}
  	return @@all
  end  
  
  def self.new_from_filename(string)
  	artist_name = string.scan(/(\w+)\s-/)[0][0]
  	name = string.scan(/-\s(.+)\./)[0][0]
  	x = Song.new()
  	x.name = name
  	x.artist_name=artist_name
  	return x
  end  
  
  def self.create_from_filename(string)
  	artist_name = string.scan(/(\w+)\s-/)[0][0]
  	name = string.scan(/-\s(.+)\./)[0][0]
  	x = Song.new()
  	x.name = name
  	x.artist_name=artist_name
  	@@all << x
  	return x
  end  
  
  def save
    self.class.all << self
  end  
  
  def self.destroy_all
    @@all.clear
  end

end

