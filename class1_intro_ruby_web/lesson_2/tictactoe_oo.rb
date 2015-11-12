
# tictactoe_oo.rb

#Nouns / Classes:
#board_hash
#draw_board
#players
#  + player 
#  + computer 
#game

require 'pry'


class Board
  WIN = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  
  attr_accessor :board
  attr_reader :data
  
  def initialize
    @data = {}
    (1..9).each {|square| @data[square] = Choice.new(' ')}
  end
  
  def draw
    system 'clear'
    puts "###########\n\n"
    puts " #{@data[1].value} | #{@data[2].value} | #{@data[3].value} "
    puts "---+---+---"
    puts " #{@data[4].value} | #{@data[5].value} | #{@data[6].value} "
    puts "---+---+---"
    puts " #{@data[7].value} | #{@data[8].value} | #{@data[9].value} "
    puts "\n###########"
  end

  def all_spaces_filled?
    empty_spaces.empty?
  end
  
  def empty_spaces
    @data.select {|position, marker| marker.value == ' '}.values
  end
  
  def empty_positions
    @data.select {|position, marker| marker.empty?}.keys
  end
  
  def mark_square(position, marker)
    @data[position].mark(marker)
  end
    
  def marked_by_player(player)
    @data.select {|k, v| v.value == player.marker}.keys
  end
  
  def marked_X
    @data.select {|k, v| v.value == "X"}.keys
  end
  
  def winner?(player)
    WIN.any? do |line| 
      @data.select {|position, marker| marker.marked_with?(player.marker) && line.include?(position)}.count == 3
    end
  end

  def two_O_in_a_row(comp_marker, human_marker)
    b = {}
    @data.each {|k,v| b[k] = v.value}
    choices = WIN.select do |line|
      b.values_at(*line).count(comp_marker) == 2 && b.values_at(*line).count(human_marker) == 0
    end
    return choices.flatten.uniq
  end
  
  def two_X_in_a_row(comp_marker, human_marker)
    b = {}
    @data.each {|k,v| b[k] = v.value}
    choices = WIN.select do |line|
      b.values_at(*line).count(human_marker) == 2 && b.values_at(*line).count(comp_marker) == 0
    end
    return choices.flatten.uniq
  end
  
  def top_positions(comp_marker, human_marker)
    b = {}
    @data.each {|k,v| b[k] = v.value}
    choices = WIN.select do |line|
      b.values_at(*line).count(human_marker) == 0 && b.values_at(*line).count(comp_marker) == 1
    end
    return choices.flatten.uniq
  end
end


class Player
  attr_reader :name, :marker
  
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end


class Choice
  attr_accessor :value
  
  def initialize(player_choice)
    @value = player_choice
  end
  
  def occupied?
    @value != ''
  end
  
  def marked_with?(marker)
    @value == marker
  end
  
  def mark(marker)
    @value = marker
  end
  
  def empty?
    @value == ' '
  end
end


class Game
  
  attr_reader :human, :computer, :current_player

  def initialize
    system 'clear'
    @board = Board.new
    puts "What's your name?"
    @human = Player.new(gets.chomp, 'X')
    @computer = Player.new("R2D2", 'O')
    @current_player = @human
  end
  
  def current_player_marks_square
    if @current_player == @human
      begin
        puts "Choose a move:"
        position = gets.chomp.to_i
        if @board.empty_positions.include?(position)  
          break
        end
        puts "Please choose an empty position:"
      end until @board.empty_positions.include?(position)
    else
      puts "Computer will play now. >> Hit Enter <<"
      gets.chomp
      win_position = @board.empty_positions.select {|pos| @board.two_O_in_a_row(@computer.marker, @human.marker).include?(pos)}.sample
      defense_position = @board.empty_positions.select {|pos| @board.two_X_in_a_row(@computer.marker, @human.marker).include?(pos)}.sample
      top_position = @board.empty_positions.select {|pos| @board.top_positions(@computer.marker, @human.marker).include?(pos)}.sample
      position = [
        win_position,
        defense_position,
        top_position,
        @board.empty_positions.sample
        ].detect {|check| check}
    end
    @board.mark_square(position, @current_player.marker)
  end
  
  def alternate_player
    if @current_player == @human
      @current_player = @computer
    else
      @current_player = @human
    end
  end
  
  def current_player_win?
    @board.winner?(@current_player)
  end

  def play
    @board.draw
    loop do
      current_player_marks_square
      @board.draw
      if current_player_win?
        puts "The winner is #{@current_player.name}"
        break
      elsif @board.all_spaces_filled?
        puts "It's a tie!"
        break
      else
        alternate_player
      end
    end
    puts "\nPlay again? (y/n)"
  end
  
end

begin
  Game.new.play
end until gets.chomp.downcase != 'y'
