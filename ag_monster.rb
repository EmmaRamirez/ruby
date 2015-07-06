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

  def strength
    return @strength
  end

  def hp
    return @hp
  end

  def edit_hp(amount)
    @hp += amount
  end

  def set_hp(amount)
    @hp = amount
  end

end
