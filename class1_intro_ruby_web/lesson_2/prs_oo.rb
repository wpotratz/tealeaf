##Nouns/Classes: 
#  Game, Player, Hand<Player, Human<Player, Computer<Player
##Verbs/Instance:
#  Game
#    play
#    :player, :computer
#  Player
#    name
#  Hand
#    pick_hand


class Player
  attr_accessor :choice
  attr_reader :name
  
  def initialize(name_choice)
    @name = name_choice
  end
  
  def to_s
    "#{name} currently has a choice of #{self.choice.value}."
  end
end

  
class Human < Player
  def pick_hand
    begin 
      puts "#{self.name}, choose a hand: (p, r, s)"
      player_choice = gets.chomp
    end until Game::CHOICES.keys.include?(player_choice)
    
    self.choice = Choice.new(player_choice)
  end
end


class Computer < Player
  def pick_hand
    self.choice = Choice.new(Game::CHOICES.keys.sample)
  end
end


class Choice
  include Comparable
  
  attr_reader :value
  
  def initialize(player_choice)
    @value = player_choice
  end
  
  def <=>(opponent)
    if self.value == opponent.value
      0
    elsif (self.value == 'p' && opponent.value == 'r') || (self.value == 'r' && opponent.value == 's') || (self.value == 's' && opponent.value == 'p')
      1
    else
      -1
    end
  end
end


class Game
  CHOICES = {"p"=>"Paper", "r"=>"Rock", "s"=>"Scissors"} 
  
  attr_reader :player, :computer
  
  def initialize
    puts "What's your name?"
    @player = Human.new(gets.chomp)
    @computer = Computer.new("R2D2")
  end
  
  def compare_choices
    if player.choice == computer.choice
      puts "Tie!"
    elsif player.choice > computer.choice
      puts "#{player.name} won!"
    else
      puts "#{computer.name} won :("
    end
    puts "Computer played #{CHOICES[computer.choice.value]}"
    puts "You played #{CHOICES[player.choice.value]}"
  end
  
  def play
    begin
      player.pick_hand
      computer.pick_hand
      compare_choices
      puts "Continue? y/n"
      continue = gets.chomp
    end until continue.downcase != 'y'
  end
end

game = Game.new.play

