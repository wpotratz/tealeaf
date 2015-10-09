
# In this example, the 'each' method will iterate to each index 
# of the array, no matter how the values of those indexes change.
# the 'shift' method removes the value of the first index, and 
# shfits the index to the right.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end


# In this example, we use the 'each' method again, but there 
# is no skipping and shifting the index. We print the value of 
# index [0] which is 1, then 'pop' the last index of the array off,
# leaving the first three values intact. Then we print the value
# of the next index which is 2, and pop of another index from the
# end of the array, leaving no more values in the array.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end