class Item
  def initialize(name, id, power, multiples)
    @name = name
    @id = id
    @power = power
    @multiples = multiples
  end
  attr_accessor :name, :id, :power, :multiples
end

sword = Item.new("sword", 1, 10, false)
tea = Item.new("tea", 2, 3, true)
shield = Item.new("shield", 3, 9, false)

$items = [sword, tea]

def add_items(item)
  if $items.include?(item) == false || item.multiples == true
    $items.push(item)
  else
    return
  end
end

# def use_item
#   puts "Which item in your inventory will you use?"
#   $items.map { |x, i| print "[#{x.id}] #{x.name} " }
#   choice = gets
#
#   # $items.index(choice)
# end

# will work -- not already included
add_items(shield)
# will NOT work -- doesn't allow multiples
add_items(shield)
# will work -- allows multiples
add_items(tea)
# will NOT work -- already included & no multiples
add_items(sword)
$items.map.with_index { |x, i| print "[#{i}] #{x.name} " }

use_item
