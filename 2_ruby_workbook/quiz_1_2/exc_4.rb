

munsters_description = "The Munsters are creepy in a good way. Yep. Yeah."

puts munsters_description
puts "-----"
puts munsters_description.swapcase
puts "-----"
puts munsters_description.downcase
puts munsters_description.upcase.swapcase
puts "-----"
puts munsters_description.upcase
puts munsters_description.downcase.swapcase
puts "-----"
puts munsters_description.downcase.capitalize
puts munsters_description.downcase.split(". ").each { |w| w.capitalize! }.join(". ")
