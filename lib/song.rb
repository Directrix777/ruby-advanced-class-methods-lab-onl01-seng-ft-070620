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

  def self.create_by_name(name)
    self.new.save
    @@all[-1].name = name
    @@all[-1]
  end

  def find_by_name(name)
    @@all.each do |song|
      return song if song.name = name
    end
    return nil
  end

  def save
    self.class.all << self
  end

end
