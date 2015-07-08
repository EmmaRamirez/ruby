#!/usr/bin/env ruby

class Item
  def initialize(name, description, use_outside, use_once, cost)
    @name = name
    @description = description
    @use_outside = use_outside
    @use_once = use_once
    @cost = cost
  end

end
