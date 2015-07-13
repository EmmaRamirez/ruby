# require_relative 'helper_functions.rb'

def choose_game
  puts "[1] New Game [2] Load Game"
  choice = gets.chomp
  if choice == "1" or choice == "New Game".downcase
    new_game
  elsif choice == "2" or choice == "Load Game".downcase
    load_game
  end
end

def new_game
  get_name
  get_caste
  home
end

def load_game
  # TODO: Add marshalling for save states to load game
end
