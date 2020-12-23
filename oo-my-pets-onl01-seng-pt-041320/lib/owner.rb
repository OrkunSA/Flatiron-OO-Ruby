class Owner
  attr_reader :name, :species
  attr_accessor :cat, :dog 
  @@all = []
  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end
  def self.all
    @@all
  end
  def say_species
    "I am a #{self.species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def pets
    @@pets
  end

  def buy_cat(name)
   Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each do |cat|
      self.cats.delete(cat)
      cat.owner = nil
      cat.mood = "nervous"
    end
    self.dogs.each do |dog|
      self.dogs.delete(dog)
      dog.owner = nil 
      dog.mood = "nervous"
    end
  end

  def list_pets
    number_of_dogs = self.dogs.count
    number_of_cats = self.cats.count
    "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end

  






end





# class Owner
#   @@all= []
#   attr_accessor :name, :pets
#   attr_reader :species

#   # Instance Methods #

#   def initialize(species)
#     @species = species
#     @@all << self
#     @pets = {:dogs => [], :cats => []}
#   end

#   def say_species
#     return "I am a #{@species}."
#   end

#   # Pets #


#   def buy_dog(name_of_dog)
#     @pets[:dogs] << Dog.new(name_of_dog)
#   end

#   def buy_cat(name_of_cat)
#     @pets[:cats] << Cat.new(name_of_cat)
#   end

#   def walk_dogs
#     @pets.collect do |species, instances|
#       if species == :dogs
#         instances.each do |dog|
#           dog.mood = "happy"
#         end
#       end
#     end
#   end

#   def play_with_cats
#     @pets.collect do |species, instances|
#       if species == :cats
#         instances.each do |cat|
#           cat.mood = "happy"
#         end
#       end
#     end
#   end



#   def sell_pets
#     @pets.collect do |species, instances|
#       instances.each do |pet|
#         pet.mood = "nervous"
#       end
#       instances.clear
#     end
#   end

#   def list_pets
#     num_dogs = @pets[:dogs].size
#     num_cats = @pets[:cats].size
#     return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
#   end

#   # Class Methods #

#   def self.all
#     @@all
#   end

#   def self.reset_all
#     @@all.clear
#   end

#   def self.count
#     @@all.size
#   end
# end