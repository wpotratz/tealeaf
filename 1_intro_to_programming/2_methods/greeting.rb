# greeting.rb

def greeting(name) 
  puts "Hey, hey, hey Mr. #{name}!"
end

puts "Enter your name, yo!"
input_name = gets.chomp

greeting(input_name)
