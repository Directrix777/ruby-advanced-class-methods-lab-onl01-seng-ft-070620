class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    self.new.save
    @@all[-1]
  end

  def self.all
    @@all
  end

  def self.new_by_name(name)
    self.new.save
    @@all[-1].name = name
    @@all[-1] 
  end

  def save
    self.class.all << self
  end

end
