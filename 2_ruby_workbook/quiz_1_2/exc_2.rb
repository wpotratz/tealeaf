

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
age_total = 0
counter = 0

ages.each do |name, age| 
  age_total = age_total + age
  puts "#{name} is #{age} years old."
  counter += 1
  counter != ages.length ? (puts "The running total is #{age_total} years.") : (puts "The grand total is #{age_total} years!")
end

