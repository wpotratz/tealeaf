

## Original 

#def color_valid(color)
#  if color == "blue" || color == "green"
#    true
#  else
#    false
#  end
#end

## Changed to:

def color_valid(color)
  %w[blue green].any? { |c| c == color }
  #color == "blue" || color == "green"
end

puts color_valid("blue")
puts color_valid("red")
puts color_valid("green")