# prs.rb (Paper, Rock, Scissors Game)

# Pseudo Code
=begin

define play options available to user and computer

define results for each combination of moves from user and computer

loop game play until, prompt user to end after a match

  prompt user for their move

  generate random move for computer

  compare user's move to computer's move

  print result of that round

  prompt user to play again or quit

=end
OPTIONS = {"p"=>"Paper", "r"=>"Rock", "s"=>"Scissors"} 

def display_winning_message (winning_choice)
  case winning_choice
  when 'p'
    puts "Paper covers Rock!"
  when 'r'
    puts "Rock smashes scissors!"
  when 's'
    puts "Scissors cuts paper!"
  end
end


# BEGIN PROGRAM
puts "Lets play!\n"

loop do
  
  #Start with user's choice
  puts "\nChoose a move! (p, r, s):"
  user_choice = gets.chomp
  
  until OPTIONS.keys.include?(user_choice)
    puts "That's not a valid choice, try again:"
    user_choice = gets.chomp
  end
  
  #Generate computer's choice
  computer_choice = OPTIONS.keys.sample
  
  #If tied
  if user_choice == computer_choice
    puts "Tie!"
  #If user wins
  elsif (user_choice == 'p' && computer_choice == 'r') || (user_choice == 'r' && computer_choice == 's') || (user_choice == 's' && computer_choice == 'p')
    display_winning_message (user_choice)
    puts "You win!"
  #If computer wins
  else
    display_winning_message (computer_choice)
    puts "You lose!"
  end
  
  #Prompt to play again
  puts "\nPlay again? (y/n)"
  break if gets.chomp.downcase != "y"
  
end

puts "Goodbye..."
