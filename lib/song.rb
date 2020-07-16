class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create(name, artist_name)
    self.name = name
    self.artist_name = artist_name
    self.save

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
