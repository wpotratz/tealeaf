

def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
puts my_string.object_id
puts my_array.object_id

tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
puts my_string.object_id
puts my_array.object_id