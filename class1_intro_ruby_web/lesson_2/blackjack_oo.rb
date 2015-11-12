# Notes:
# - I improvised a fair amount. I enjoy the practice.
# - I felt that a dealer is a player, but does not have all of the same 
#   features as other players. Also, I created 'computer' and 'human' players 
#   with the intention of allowing for multiple players, though I did not fully  
#   see that through. Some 'Game' methods are using just 'player1' rather than 
#   iterating through each player, and I didn't build gameplay for computer 
#   (non-human) users.
# - I was not very consistent with using the puts/print method either within 
#   each method or in the game engine. It seems better to use them in the
#   engine so that you can be more flexible in how the method results are
#   displayed. Is that a good srategy? Does it matter that much?
#
#   Thanks for your input

require 'pry' 


module Bank
  attr_accessor :bank, :wager
  
  def initialize(name)
    super(name)
    @bank = 1000
    @wager = 0
  end
  
  def show_bank
    print "You have #{bank.to_currency} in the bank."
  end
  
  def show_wager
    print "Your current wager is #{wager.to_currency}."
  end
  
  def check_wager(amount)
    amount = (amount / 10) * 10
    (amount > bank || amount <= 0) ? false : amount
  end
  
  def bet
    print "\n"; show_bank; print " "
    puts "Choose your wager, #{name} (multiples of $10):"
    begin 
      self.wager = check_wager(gets.chomp.to_i)
      puts "Please check your bank and enter a valid bet." if !wager
    end until wager
    self.bank -= wager
    puts "You've bet #{wager.to_currency}, and have #{bank.to_currency} remaining."
  end
  
  def update_bank
    case
      when win == 'push' then self.bank += wager
      when win then self.bank += (wager * 2)
    end 
    self.wager = 0
  end 
end


class Fixnum
  def to_currency
    "$#{self.to_i}"
  end 
end 


module Hand
  attr_accessor :win
  
  def initialize
    @win = false
  end
  
  def hide_first_card
    if hand.select {|card| card.label == '?'}.size > 0
      puts "You've already hidden the first card!"
    else
      hidden << hand.shift
      hand.unshift(Cards.new('?', 'X'))
    end
  end
  
  def reveal_hidden_card
    if hidden.empty?
      puts "No hidden cards!"
    else
      hand.delete_if {|card| card.label == '?'}
      hand.unshift(hidden.pop)
    end
  end
  
  def total
    hand_total = 0
    # Assign values based on 'label'
    hand.each do |card|  
      hand_total +=  case  
                  	  when card.label == 'A' then 11
                  	  when card.label == '?' then 0
                  	  when card.label.to_i == 0 then 10
                  	  else card.label.to_i
            	      end
    end
    # Adjust total based on number of 'aces' in hand
  	hand.select {|card| card.label == 'A'}.each do |ace| 
  	  if hand_total > Game::BLACKJACK_TOTAL
  	    then hand_total -= 10
  	  end
  	end
    # return total
  	return hand_total
  end
  
  def hand_display
    (1..5).to_a.each do |line|
      hand.each {|card| print "  "; card.show(line)}
      print "\n"
    end
  end
  
  def bust?
    total > Game::BLACKJACK_TOTAL
  end
  
  def blackjack
    total == Game::BLACKJACK_TOTAL
  end
  
  def win_lose?
    bust? || blackjack
  end
  
  def hit_or_stay(current_deck)
    puts "Hit or stay? (h/s)"
    begin
      choice = gets.chomp.downcase
      if choice == 'h'
        current_deck.deal_cards(self); show_table;
      elsif choice != 's'
        puts "Please choose 'h' or 's'"
      end
    end until choice == 'h' || choice == 's'
    choice
  end
  
  def show_hand
    puts "---- #{name}'s Hand ----"
    hand_display
    puts "Total: #{total}\n"
  end  
end


class Player
  include Hand
  
  attr_accessor :name, :hand, :hidden
  
  def initialize(name)
    @name = name
    @hand = []
    @hidden = []
  end
end


class Computer < Player
  include Bank
  
  def initialize(name)
    super(name)
  end  
end


class Human < Player
  include Bank
  
  def initialize(name)
    super(name)
  end  
end


class Dealer < Player
  def initialize(name='Hank, the dealer')
    super(name)
  end
end   

class Cards
  LABELS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
	SUITS = {'H' => 'Hearts', 'D' => 'Diamonds', 'S' => 'Spades', 'C' => 'Clubs', 'X' => 'Hidden'}
  DRAW_SUITS = {
    'D' => [
      " /\\ ",
      "(  )",
      " \\/ "
      ],
    'H' => [   
      "/\\/\\",
      "\\  /",
      " \\/ "
      ],
    'S' => [  
      " /\\ ",
      "(  )",
      " || "
      ],
    'C' => [
      " () ",
      "(  )",
      " || "
      ],
    'X' => [
      "    ",
      "    ",
      "    "
      ]
    }
  
  attr_accessor :label, :suit
  
  def initialize(label, suit)
    @label = label
    @suit = suit
  end
  
  def suit_name
    SUITS[suit]
  end
  
  def show(card_option="whole_card")
    gap = (label.to_s.size == 2) ? '' : '_'
    line1 = " _____ "
    line2 = "|#{DRAW_SUITS[suit][0]} |"
    line3 = "|#{DRAW_SUITS[suit][1]} |"
    line4 = "|#{DRAW_SUITS[suit][2]} |"
    line5 = "|___#{label + gap}|"
    case card_option
      when "whole_card" then puts line1; puts line2; puts line3; puts line4; puts line5
      when 1 then print line1
      when 2 then print line2
      when 3 then print line3
      when 4 then print line4
      when 5 then print line5
    else puts "bad card option"
    end
  end
end


class Deck
  attr_accessor :cards

  def initialize
	  @cards = build_deck(2)
  end
  
  def build_deck(num_of_decks)
    deck = []
    num_of_decks.to_i.times do
      Cards::LABELS.each do |label|
        ['H','D','S','C'].each {|suit| deck << Cards.new(label, suit)}
      end
    end
    return deck
  end
  
  def shuffle_cards(num_of_shuffles=2)
    num_of_shuffles.times {cards.shuffle!}
  end
  
  def deal_cards(player, num_of_cards=1, show_card=true)
    new_cards = []
    num_of_cards.times {new_cards << cards.pop} 
    new_cards.each {|card| card.show if show_card; player.hand << card}
  end
  
  def deal_one
    cards.pop
  end
  
  def size
    cards.size
  end
end


class Game
  DEALER_MAX_TOTAL = 17
  BLACKJACK_TOTAL = 21
  
  attr_accessor :players, :player1, :dealer, :deck, :win
  
  def initialize
    system 'clear'
    puts "Blackjack!\n"
    puts "Hit <Enter> to play."
    gets.chomp
    puts "What's your name?"
    @player1 = Human.new(gets.chomp)
    @dealer = Dealer.new
    @players = [self.player1]
    play
  end
  
  def show_table
    system 'clear'
    puts "\n"
    player1.show_bank; print " "; player1.show_wager
    puts "\n\n"
    dealer.show_hand
    puts ""
    player1.show_hand
    puts "\n"
  end
  
  def discard
    players.each {|player| player.hand.clear}
    dealer.hand.clear
  end
  
  def hit(player)
    deck.deal_cards(player)
    show_table
  end
  
  def take_bets
    players.each {|player| player.bet}
  end
  
  def initial_deal
    @deck = Deck.new
    deck.shuffle_cards
    deck.deal_cards(player1,2,false)
    deck.deal_cards(dealer,2,false)
    dealer.hide_first_card
    show_table
  end
  
  def player_turn
    loop do
      break if player1.win_lose?
      puts "Hit or stay? (h/s)"
      choice = gets.chomp.downcase
      case choice 
        when 'h' then hit(player1)
        when 's' then break
        else puts "Please choose 'h' or 's'"; next
      end
      show_table
    end
  end 
  
  def dealer_turn
    dealer.reveal_hidden_card if !player1.blackjack && !player1.bust?
    show_table
    loop do
      break if player1.win_lose?
      case
        when dealer.win_lose? then break
        when dealer.total < DEALER_MAX_TOTAL then hit(dealer)
        when dealer.total < player1.total then hit(dealer)
        when dealer.total == player1.total then break
        else break
      end
    end 
  end 
        
  def game_summary
    players.each do |player|
      case
        when player.blackjack then puts "Blackjack!, #{player.name} wins."; player.win = true
        when dealer.blackjack then puts "Dealer hit blackjack. #{player.name} loses."; player.win = false
        when player.bust? then puts "#{player.name} busted... :("; player.win = false
        when dealer.bust? then puts "The dealer busts. #{player.name} wins!"; player.win = true
        when player.total == dealer.total then puts "Push."; player.win = 'push'
        when player.total > dealer.total then puts "#{player.name} has #{player.total}, and #{dealer.name} has #{dealer.total}. #{player.name} wins!"; player.win = true
        when player.total < dealer.total then puts "#{player.name} has #{player.total}, but #{dealer.name} has #{dealer.total}. #{player.name} loses."; player.win = false
      end 
      player.update_bank
    end
  end
    
  def farewell_or_restart
    print "\nWell, "
    players.each do |player|
      print "#{player.name}, #{player.bank <= 0 ? 'you\'re broke' : 'you ended with ' + player.bank.to_currency}! "
      puts  case 
              when player.bank > 1000 then "You're a natural gambler!"
              when player.bank == 1000 then "No harm no foul."
              when player.bank > 0 then "At least we didn't take all of it..."
              else "Sorry for your loss..."
            end
    end
    puts "Would you like to start the game again? (y/n)"
    gets.chomp.downcase == 'y' ? Game.new.play : (puts "Bye bye"; exit)
  end
  
  def play
    loop do
      loop do 
        system 'clear'
        discard
        take_bets
        initial_deal
        player_turn
        dealer_turn
        game_summary
        break if player1.bank <= 0
        puts "\nPlay again? (y/n)"
        break if gets.chomp.downcase != 'y' 
      end
    farewell_or_restart
    end
  end

end

Game.new
