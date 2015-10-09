

# A)
def mess_with_vars(one, two, three)
  one = two 
#  puts one.object_id
  two = three
#  puts two.object_id
  three = one
#  puts three.object_id
  puts "---"
  puts one.object_id
  puts two.object_id
  puts three.object_id
end

one = "one"
two = "two"
three = "three"
  puts "---"
  puts one.object_id
  puts two.object_id
  puts three.object_id
  puts "---"
  
mess_with_vars(one, two, three)

  puts "---"
  puts one.object_id
  puts two.object_id
  puts three.object_id
  puts "---"

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

## The outside variables are not changed by the function


# B)
  
  puts "Example B)"
  def mess_with_vars(one, two, three)
    one = "two"
    two = "three"
    three = "one"
  end

  one = "one"
  two = "two"
  three = "three"

  mess_with_vars(one, two, three)

  puts "one is: #{one}"
  puts "two is: #{two}"
  puts "three is: #{three}"
  
  # The function still isn't changing the values of the outside variables
  
  
  # C)
  puts "Example C)"
  
    def mess_with_vars(one, two, three)
    one.gsub!("one","two")
    two.gsub!("two","three")
    three.gsub!("three","one")
  end

  one = "one"
  two = "two"
  three = "three"

  mess_with_vars(one, two, three)

  puts "one is: #{one}" #<< "two"
  puts "two is: #{two}" #<< "three"
  puts "three is: #{three}" #<< "one"
  
  