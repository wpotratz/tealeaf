# Describe the difference between ! and ? in Ruby. 
# And explain what would happen in the following scenarios:

# '!' is used for some methods to 'mutate the caller' or to change the value of
# the variable or parameter that is being passed to the method. It can also be
# used with an expression to change the expressions evaluated true/false value 
# to it's opposite.

#1. != is used to represent an inequality between to expressions.

#2. Putting '!' in front of an existing variable produces the opposite of the 
# value that the expression evaluatees to. If the expression evalutate to 
# false or nil, the '!' of that value is true. 
user_name = nil
puts "value is nil"
puts "puts !user_name returns: #{!user_name}"
puts "puts user_name returns: #{user_name}"
puts "---------"

user_name = false
puts "value is false"
puts "puts !user_name returns: #{!user_name}"
puts "puts user_name returns: #{user_name}"
puts "---------"

user_name = true
puts "value is true"
puts "puts !user_name returns: #{!user_name}"
puts "puts user_name returns: #{user_name}"
puts "---------"

user_name = 'wesleyp'
puts "value is 'wesleyp'"
puts "puts !user_name returns: #{!user_name}"
puts "puts user_name returns: #{user_name}"
puts "---------"

# Naming a new variable with '!' preceding it seems to just declare the
# variable as though it were not named with a '!'.

puts "Here's the result of declaring the variable '!other_user_name' = 'wpotratz'"
!other_user_name = 'wpotratz'
puts !other_user_name
puts other_user_name

# Multiple '!' before an expression result in a toggle between true and false
# depending on the number of occurances. 
my_name = 'wesley'
puts my_name
puts !!my_name
puts !!!my_name
puts !!!!my_name
puts !!!!!my_name

# puts my_name? and ?my_name produce errors and the program is halted.

# ? is used in an 'if' statement in short form
