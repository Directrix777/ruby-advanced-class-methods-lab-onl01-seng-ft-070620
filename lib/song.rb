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
    instance = self.new
    instance.name = name
    instance
  end

  def self.create_by_name(name)
    new_by_name(name).save
    @@all[-1]
  end

  def self.find_by_name(name)
    @@all.each do |song|
      return song if song.name == name
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) unless !self.find_by_name(name)
    return create_by_name(name)
  end

  def self.alphabetical
    names = []
    alpha = []
    @@all.each do |song|
      names << song.name
    end
    names = names.sort
    names.each do |name|
      alpha << self.find_by_name(name)
    end
    alpha
  end

  def self.new_from_filename(filename)
    words = filename.split(" - ")
    words[1] = words[1].split(".")[0]
    instance = self.new_by_name(words[1])
    instance.artist_name = words[0]
    instance
  end

  def self.create_from_filename(filename)
    words = filename.split(" - ")
    words[1] = words[1].split(".")[0]
    instance = self.create_by_name(words[1])
    instance.artist_name = words[0]
    instance
  end

  def save
    self.class.all << self
  end
end
