
puts "Write something!:"
input = gets.chomp

while input != 'STOP'
  puts "You wrote: \"#{input}\""
  puts "Write something else!:"
  input = gets.chomp
end
