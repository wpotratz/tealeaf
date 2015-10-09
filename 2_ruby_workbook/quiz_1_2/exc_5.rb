

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

puts ages
puts additional_ages

#additional_ages.each do |k,v| 
#  ages[k] = v
#end

ages.merge!(additional_ages)

puts "----"

puts ages
