def transaction(price, item)
  if price > $hero.gems
    puts "You can't afford this!"
    return
  else
    $hero.edit_gems((price * -1))
    add_item(item)
  end
end

def will_you_purchase_it?
  while true
    print "Will you purhcase it? [y/n]: "
    response = gets
    case response
    when /^[yY]/
      return true
    when /^[nN]/, /^$/
      return false
    end
  end
end

def ensure_purchase
  if will_you_purchase_it? == true
    return
  else
    puts "Clerk: Oh, I'm sorry! I didn't mean to show you the wrong item!"
  end
end

def market_banner
  puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
  puts "|   Welcome to the market!   |"
  puts "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"
end

def market
  seen_market = false
  if seen_market == false
    market_banner
    seen_market = true
  end
  enter
  puts "Clerk: How may I help you?"
  puts "[1] Purchase [2] Sell"
  response = gets.to_i
  if response == 1
    puts "Clerk: Well here's what we have in-stock today..."
    puts "[1] Turtle Armor -- 50 gems\n[2] Leek Sword -- 70 gems\n[3] Arizona Tea -- 80 gems"
    response = gets.to_i
    if response == 1
      puts "A tiny, but useful shield in the design of a turtle. Helps take hits."
      ensure_purchase
      transaction(50, "turtle armor")
    elsif response == 2
      puts "A sword, made out of a leek. Increases power against monsters."
      ensure_purchase
      transaction(70, "leek sword")
    elsif response == 3
      puts "A can of tea. Replenishes health during battle once."
      transaction(80, "arizona tea")
    end
  elsif response == 2
    puts "Current function not available."
  else
    "Sorry, I didn't quite catch that..."
  end

  # TODO: make this work
  # puts "Are you done shopping? [y/n]"
  # response = gets
  # if response == /^[yY]/
  #   "Clerk: Ok, have a great day!\nYou decided to return to your base camp."
  #   home
  # else
  #   market
  # end

end
