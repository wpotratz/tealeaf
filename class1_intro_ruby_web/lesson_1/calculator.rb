##  calculator.rb ##

=begin ##################################
retrieve and store first number input from user
retrieve and store math operation from user
retrieve and store second number input from user

if operation is add
  then add first number and second number
if || minus
  then subtract ||
  ...
  
print resulting number to the screen
=end   ##################################

# 'say' method for messaging to user
def say (comment)
  puts "=> #{comment}"
end

# 'num_check' method for ensuring user enters a number
def num_check (input)
  while input =~ /[^0-9\.]/
    puts "That's not a number, please try again:"
    input = gets.chomp
  end
  return input
end

# hash for displaying the operator correctly in result message
operators = {
  "1" => "+",
  "+" => "+",
  "2" => "-",
  "-" => "-",
  "3" => "/",
  "/" => "/",
  "4" => "x",
  "x" => "x",
  "*" => "x"
}


# BEGIN PROGRAM
say "Enter first number:"

loop do
  # Get first number to compute from user
  num1 = gets.chomp
  break if num1.upcase == 'Q'
  num1 = num_check(num1)
  
  # Get operation from user
  say "Choose your operation:"
  say "1) Add(+)   2) Subtract(-)   3) Divide(/)   4) Multiply(x)"
  operation = gets.chomp
  break if operation.upcase == 'Q'
  
  # Get second number to compute from user
  say "Enter second number:"
  num2 = gets.chomp
  break if num2.upcase == 'Q'
  num2 = num_check(num2)
  
  # produce result
  case operation
    when "1", "+"
      result = num1.to_i + num2.to_i
    when "2", "-"
      result = num1.to_i - num2.to_i
    when "3", "/"
      result = num1.to_f / num2.to_f
    when "4", "*", "x"
      result = num1.to_i * num2.to_i
    else
      result = "what's wrong?"
  end
  
  result = result.to_i if result % 1 == 0

  # print result
  puts "###################"
  say "#{num1} #{operators[operation]} #{num2} = #{result}\n"
  puts "###################"
  gets.chomp
  
  # prompt user to 'quit' or 'continue with another calculation'
  say "Enter 'q' to quit, first number to make another calulation:"
end

say "Goodbye..."