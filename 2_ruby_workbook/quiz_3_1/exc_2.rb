

greetings = { a: 'hi' }  #<< creates a hash {:a => "hi"}
informal_greeting = greetings[:a] #<< sets this variable to the value "hi"
puts greetings.object_id
puts greetings[:a].object_id
puts informal_greeting.object_id
puts informal_greeting
informal_greeting << ' there' #<< changes the value to "hi there"

puts informal_greeting  #  => "hi there"
puts greetings # Returns {:a => "hi"}
