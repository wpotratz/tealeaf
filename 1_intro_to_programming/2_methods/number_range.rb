


def number_range(num)
  num = num.to_i
  
#  if num < 0
#    puts "That's a negative number fool!"
#  elsif num <= 50
#    puts "#{num} is between 0 and 50"
#  elsif num <= 100
#    puts "#{num} is between 51 and 100"
#  else
#    puts "#{num} is a big-ass number!"
#  end

  case num
  when 0..50
    puts "#{num} is between 0 and 50"
  when 51..100
    puts "#{num} is between 51 and 100"
  else 
    if num < 0
      puts "That's a negative number fool!"
    else
      puts "#{num} is a big-ass number!"
    end
  end
end

puts "Give me a number!:"

number_range(gets)

#number_range(-1)

number_range(1)

number_range(53)

number_range(101)
