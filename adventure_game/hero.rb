class Hero
  def initialize(name, maxhp, hp, caste, magic, strength, defense, speed, intelligence, inventory, monsters_killed)
    @name, @maxhp, @hp, @caste, @magic, @strength, @defense, @speed, @intelligence, @inventory, @monsters_killed = name, maxhp, hp, caste, magic, strength, defense, speed, intelligence, inventory, monsters_killed
  end


  attr_accessor :name, :maxhp, :hp, :caste, :magic, :strength, :defense, :speed, :intelligence, :inventory, :monsters_killed
end
