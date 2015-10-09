ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }


ages.each_pair do |key,value|
  if key == "Spot" && value
    puts "Yes #{key} is #{value} years old!"
  end
end

ages["Spot"] = nil

ages.each_pair do |key,value|
  if key == "Spot" && value
    puts "Yes #{key} is #{value} years old!"
  end
end

ages["Spot"] = 20

ages.each_pair do |key,value|
  if key == "Spot" && value
    puts "Yes #{key} is #{value} years old!"
  end
end

p ages