#!/usr/bin/env ruby

require_relative 'ag_hero_classes.rb'

class Mage < Hero
  def initialize(name, hp)
    super(name, hp)
  end

end

class Knight < Hero
  def initialize(name, hp)
    super(name, hp)
  end
end

class Warrior < Hero
  def initialize(name, hp)
    super(name, hp)
  end
end
