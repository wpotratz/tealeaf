#tictactoe.rb

=begin
. build initial board 
. define players (user, computer)
. define hash of board positions and values
. prompt user to play
. user input updates board hash (update_board)
. refresh board draw (draw_board)
. check for winner
. determine available spaces for computer turn
. choose computers move randomly
. check for winner
. update board hash (update_board)
. refresh board draw
=end

require 'pry'

def initialize_board
  b = {}
  (1..9).each {|n| b[n] = ' '}
  b
end

def draw_board (p)
  system 'clear'
  puts "###########"
  puts ""
  puts " #{p[1]} | #{p[2]} | #{p[3]} "
  puts "---+---+---"
  puts " #{p[4]} | #{p[5]} | #{p[6]} "
  puts "---+---+---"
  puts " #{p[7]} | #{p[8]} | #{p[9]} "
  puts ""
  puts "###########"
end

def empty_spaces (b)
  b.select {|k,v| v == " "}.keys
end

WIN = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

def check_winner(b)
  WIN.each do |a| 
    return "Player" if b.values_at(*a).count('X') == 3
    return "Computer" if b.values_at(*a).count('O') == 3
  end
  nil
end

def two_O_in_a_row(b)
  choices = WIN.select do |a|
    b.values_at(*a).count('O') == 2 && b.values_at(*a).count('X') == 0
  end
  return choices.flatten.uniq
end

def two_X_in_a_row(b)
  choices = WIN.select do |a|
    b.values_at(*a).count('X') == 2 && b.values_at(*a).count('O') == 0
  end
  return choices.flatten.uniq
end

def top_positions(b)
  choices = WIN.select do |a|
    b.values_at(*a).count('X') == 0 && b.values_at(*a).count('O') == 1
  end
  return choices.flatten.uniq
end

def player_picks_square (b)
  puts "Player, choose a position to play (1-9)"
  position = gets.chomp.to_i
  b[position] = "X"
end

def computer_picks_square (b)
  puts "Computer will play now. >> Hit Enter <<"
  gets.chomp
  win_position = empty_spaces(b).select {|s| two_O_in_a_row(b).include?(s) }.sample
  defense_position = empty_spaces(b).select {|s| two_X_in_a_row(b).include?(s) }.sample
  top_position = empty_spaces(b).select {|s| top_positions(b).include?(s) }.sample
  binding.pry
  position = case 
    when win_position
      win_position
    when defense_position
      defense_position
    when top_position
      top_position
    else empty_spaces(b).sample
  end
  b[position] = "O"
end


board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
  break if winner || empty_spaces(board).empty?
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_spaces(board).empty?


if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end