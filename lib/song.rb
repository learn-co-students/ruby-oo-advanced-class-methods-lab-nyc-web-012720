class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name (name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.new
    song.name = name
    song.save
    song
  end

  # def self.find_by_name (name)
  #   song_found = nil
  #   song_name = nil
  #   self.all.each do |song|
  #     if song.name == name
  #       song_found = true
  #       song_name = song
  #     end
  #   end
  #     if song_found == true
  #       song_name
  #     else
  #       false
  #   end
  # end

  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

  # def self.find_or_create_by_name (name)
  #   if !self.find_by_name (name)
  #     self.create_by_name (name)
  #   else
  #     self.find_by_name (name)
  #   end
  # end

    def self.find_or_create_by_name (name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    end

    def self.alphabetical
      self.all.sort_by{|song| song.name}
    end

    def self.new_from_filename (filename)
      filename_array = filename.split(/-|\./)
      song = Song.new
      song.name = filename_array[1].strip
      song.artist_name = filename_array[0].strip
      song
    end

    def self.create_from_filename (filename)
      filename_array = filename.split(/-|\./)
      song = self.create
      song.name = filename_array[1].strip
      song.artist_name = filename_array[0].strip
      song
    end

    def self.destroy_all
      self.all.clear
    end

    

end
