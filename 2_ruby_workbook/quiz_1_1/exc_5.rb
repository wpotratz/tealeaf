def number_check(number, lower, upper)
  if (lower..upper).cover?(number)
    then puts "Yep, that number is in between."
  else
    puts "Nope it's not"
  end
end

number_check(42, 10, 100)
number_check(9, 10, 100)
number_check(101, 10, 100)