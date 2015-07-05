#!/usr/bin/env ruby

class Board
  BOARD_MAX_INDEX = 2
  EMPTY_POS = ' '
  COMPUTER_PLAYER = 'X'
  HUMAN_PLAYER = 'O'

  def initialize(current_player)
    @current_player = current_player
    @board = Array.new(BOARD_MAX_INDEX + 1) {
      Array.new(BOARD_MAX_INDEX + 1) { EMPTY_POS }
    }
  end

  def display
    puts "+- - - - - - +"
    for row in 0..BOARD_MAX_INDEX
      # print has to be use when you don't want a line break
      print "| "
      for col in 0..BOARD_MAX_INDEX
        s = @board[row][col]
        if s == EMPTY_POS
          print col + (row * 3) + 1
        else
          print s
        end
        print " | "
      end
      puts "\n+- - - - - - +"
    end
  end

  def board_full
    for row in 0..BOARD_MAX_INDEX
      for col in 0..BOARD_MAX_INDEX
        if @board[row][col] == EMPTY_POS
          return false
        end
      end
    end
    return true
  end

  def winner
    winner = winner_rows()
    if winner
      return winner
    end
    winner = winner_cols()
    if winner
      return winner
    end
    winner = winner_diagonals()
    if winner
      return winner
    end
    return
  end

  def winner_rows
    for row_index in 0..BOARD_MAX_INDEX
      first_symbol = @board[row_index][0]
      for col_index in 1..BOARD_MAX_INDEX
        if first_symbol != @board[row_index][col_index]
          break
        elsif col_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
          return first_symbol
        end
      end
    return
    end
  end

  def winner_cols
    for col_index in 0..BOARD_MAX_INDEX
      first_symbol = @board[0][col_index]
      for row_index in 1..BOARD_MAX_INDEX
        if first_symbol != @board[row_index][col_index]
          break
        elsif row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
          return first_symbol
        end
      end
    end
    return
  end

  def winner_diagonals
    first_symbol = @board[0][0]
    for index in 1..BOARD_MAX_INDEX
      if first_symbol != @board[index][index]
        break
      elsif index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    first_symbol = @board[0][BOARD_MAX_INDEX]
    row_index = 0
    col_index = BOARD_MAX_INDEX
    while row_index < BOARD_MAX_INDEX
      row_index = row_index + 1
      col_index = col_index - 1
      if first_symbol != @board[row_index][col_index]
        break
      elsif
        row_index == BOARD_MAX_INDEX and first_symbol != EMPTY_POS
        return first_symbol
      end
    end
    return
  end

  def check_rows(player, )
    for row_index in 0..BOARD_MAX_INDEX

  end


  def ask_player_for_move(current_player)
    if current_player == COMPUTER_PLAYER
      computer_move(current_player)
    else
      human_move(current_player)
    end
  end

  def human_move(current_player)
    played = false
    while not played
      puts "Player " + current_player + ": Where would you like to play?"
      move = gets.to_i - 1
      col = move % @board.size
      row = (move - col) / @board.size
      if validate_position(row, col)
        @board[row][col] = current_player
        played = true
      end
    end
  end

  def computer_move(current_player)
    row = -1
    col = -1
    found = "F"

    check_rows(COMPUTER_PLAYER, found)
    check_cols(COMPUTER_PLAYER, found)
    check_diagonals(COMPUTER_PLAYER, found)

    check_rows(HUMAN_PLAYER, found)
    check_cols(HUMAN_PLAYER, found)
    check_diagonals(HUMAN_PLAYER, found)

    if found == "F"
      if @board[1][1] == "EMPTY_POS"
        row = 1
        col = 1
        @board[row][col] = current_player
      elsif available_corner()
        pick_corner(current_player)
      else
        until validate_position(row, col)
          row = rand(@board.size)
          col = rand(@board.size)
        end
        @board[row][col] = current_player
      end
    end
  end


  def validate_position(row, col)
    if row <= @board.size and col <= @board.size
      if @board[row][col] == EMPTY_POS
        return true
      else
        puts "That position is occupied."
      end
    else
      puts "Invalid position."
    end
    return false
  end

  def get_next_turn
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
    return @current_player
  end


end
