require "pry"

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|title| title.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all = @@all.sort_by{|song| song.name}
  end

  
  def self.new_from_filename(name)
    song = self.new 
    song.name = name.split(" - ")[1].chomp(".mp3")
    song.artist_name = name.split(" - ")[0]
    song
  end

  def self.create_from_filename(name)
    #class method should not only parse the filename correctly but should also save the song
      song = self.new
      song.name = (name.split(" - ")[1].chomp(".mp3"))
      song.artist_name = (name.split(" - ")[0])
      @@all << song
      song
    end

    def self.destroy_all
      #reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
      @@all.clear
    end


end

