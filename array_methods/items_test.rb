class Item
  def initialize(name, power, multiples)
    @name = name
    @power = power
    @multiples = multiples
  end
  attr_accessor :name, :power, :multiples
end

sword = Item.new("sword", 10, false)
tea = Item.new("tea", 3, true)
shield = Item.new("shield", 9, false)

$items = [sword, tea]

def add_items(item)
  if $items.include?(item) == false || item.multiples == true
    $items.push(item)
  else
    return
  end
end

# will work -- not already included
add_items(shield)
# will NOT work -- doesn't allow multiples
add_items(shield)
# will work -- allows multiples
add_items(tea)
# will NOT work -- already included & no multiples
add_items(sword)
$items.map.with_index { |x, i| print "[#{i}] #{x.name} "}
