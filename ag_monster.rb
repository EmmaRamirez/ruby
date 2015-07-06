#!/usr/bin/env ruby

class Monster
  # REVIEW: adding new traits like kindness, speed
  def initialize(species, strength)
    @species = species
    @strength = strength
    @hp = 100
  end

  def species
    return @species
  end

  def access_strength
    return @strength
  end

end
