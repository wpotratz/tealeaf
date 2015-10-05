puts "How old are you?"

age = gets.chomp
age = age.to_i

puts "neato!"

add_age = 10
message = "In " + add_age.to_s + "years you will be "

puts message + (age + add_age).to_s

add_age = 20
message = "In " + add_age.to_s + "years you will be "
puts message + (age + add_age).to_s

add_age = 30
puts message + (age + add_age).to_s

add_age = 40
puts message + (age + add_age).to_s


