# blackjack.rb

## In hindsight...
# 1) could probably have just used nested arrays instead of getting hashes involved
# 2) didn't need to be crazy with building the deck. I know it's hard to read


#require 'pry'  
  
def say(input)
  puts "=> #{input}"
end

def show_bank(money, bet = nil)
  puts "  Bank: $#{money}"
  puts "  Your Wager: $#{bet}" if bet
  puts "\n\n"
end

def build_deck 
  card_suits = ['Diamonds','Clubs','Spades','Hearts']
  card_values = {}
  (2..10).collect {|n| n.to_s}.each {|v| card_values[v] = v.to_i }
  ['J','Q','K','A'].each {|v| v == 'A' ? card_values[v] = 1 : card_values[v] = 10} 
  deck = []
  card_values.each do |l,v| 
    card_suits.each {|s| deck << {[l, s] => v} }
  end
  return deck
end

def show_cards(cards)
  cards.each {|c| puts "[#{c.keys.first.first} of #{c.keys.first.last}]" }
end

def cards_visible(cards)
  cards[1..cards.size]
end

def deal_player(hand, deck)
  new_card = deck.pop
  hand << new_card
  return new_card
end

def player_total(hand)
  total = []
  hand.each {|h| total << h.values[0]}
  if hand.select {|card| card.values[0] == 1}.count > 0 && total.inject(:+) + 10 <= 21
    # If there's an Ace in the hand && if the total of the hand with one Ace as 11 is under 21
    # You would never want more than one ace to be 11, so you will only ever add 10 once regardless of ace count
    return total.inject(:+) + 10
  else
    return total.inject(:+)
  end
end

def show_table(player, dealer, show_dealer = false)
  puts "_________________________\n"
  puts " Dealer's hand': #{show_dealer ? player_total(dealer) : player_total(cards_visible(dealer)).to_s + " + ?"}"
  if show_dealer 
    show_cards(dealer)
  else
    puts "[ Hidden Card ]"
    show_cards(cards_visible(dealer)).to_s 
  end
  puts ""
  puts " Your hand: #{player_total(player)}"
  show_cards(player)
  puts "_________________________\n\n\n"
end


def bust?(hand)
  player_total(hand) > 21
end

def game_summary(player, dealer)
  say "Dealer has #{player_total(dealer)}, and you have #{player_total(player)}!"
end

# BEGIN GAME
begin
  # Initialize game
  player_money = 1000
  say "Let's play!\n"  
  say "Hit >Enter< to continue..."
  gets.chomp  
  
  loop do 
    # Wagers
    system 'clear'
    show_bank(player_money)
    say "You have $#{player_money} to gamble away"
    say "How much do you want to bet?"
    wager = gets.chomp.to_i
    player_money -= wager.to_i
    say "Here we go!"
    
    # Build deck and deal
    system 'clear'
    current_deck = build_deck
    current_deck << build_deck # << To use more than one deck
    current_deck.flatten!
    current_deck.shuffle!
    current_deck.shuffle! # << Give it an extra shuffle :)
    
    player_hand = []
    dealer_hand = []
    
    deal_player(player_hand, current_deck)
    deal_player(player_hand, current_deck)
    
    deal_player(dealer_hand, current_deck)
    deal_player(dealer_hand, current_deck)
    
    system 'clear'
    show_bank(player_money, wager)
    show_table(player_hand, dealer_hand)
    
    loop do # Player's turn
      #binding.pry
      if player_total(player_hand) == 21
        player_hand.size === 2 ? (say "Blackjack! You win!\n") : (say "You win!\n")
        break
      end
      if bust?(player_hand)
        say "You bust!\n"
        break
      end

      say "Want another card? (y/n)"
      break if gets.chomp.downcase != 'y'
      new_card = [deal_player(player_hand, current_deck)]
      system 'clear'
      show_bank(player_money, wager)
      show_table(player_hand, dealer_hand)
      say "You are dealt:"
      show_cards(new_card)
    end 
    
    # Dealer's turn
    
    
    say "Dealer's turn. > Hit Enter to continue <" if !bust?(player_hand) && player_total(player_hand) != 21
    gets.chomp

    system 'clear'
    show_bank(player_money, wager)
    show_table(player_hand, dealer_hand, true)
  
    loop do 
      if player_total(player_hand) == 21 || bust?(player_hand)
        #game_summary(player_hand, dealer_hand)
        break
      end
      case
      when player_total(dealer_hand) == 21
        system 'clear'
        show_bank(player_money, wager)
        show_table(player_hand, dealer_hand, true)
        say "Dealer wins..."
        game_summary(player_hand, dealer_hand)
        break
      when player_total(dealer_hand) > 21
        system 'clear'
        show_bank(player_money, wager)
        show_table(player_hand, dealer_hand, true)
        say "Dealer busts. You win!"
        break
      when player_total(dealer_hand) == player_total(player_hand)
        system 'clear'
        show_bank(player_money, wager)
        show_table(player_hand, dealer_hand, true)
        say "Push. The dealer tied with your total."
        break
      when player_total(dealer_hand) > player_total(player_hand)
        system 'clear'
        show_bank(player_money, wager)
        show_table(player_hand, dealer_hand, true)
        say "Dealer wins."
        game_summary(player_hand, dealer_hand)
        break
      when player_total(dealer_hand) < 17 || player_total(dealer_hand) < player_total(player_hand) 
        say "Dealer takes another card:"
        new_card = [deal_player(dealer_hand, current_deck)]
        show_cards(new_card)
        gets.chomp
        system 'clear'
        show_bank(player_money, wager)
        show_table(player_hand, dealer_hand, true)
      end
    end
    
    if ( player_total(player_hand) > player_total(dealer_hand)  &&  !bust?(player_hand) ) || bust?(dealer_hand)
      player_money += (wager * 2)
    end
    
    puts "\n"
    
    if player_money > 0
      say "Play again? (y/n)" 
      break if gets.chomp.downcase != 'y'
    else
      say "You're broke :("
      break
    end
    
  end 
  say "Reset or Quit (r/q)"
end until gets.chomp.downcase == 'q'

if player_money == 0 
  say "Better luck next time!"
elsif player_money < 0
  say "You owe me some money, buddy..."
else
  say "Don't spend it all in one place!\n"
end

say "Goodbye...\n"

#
# END GAME