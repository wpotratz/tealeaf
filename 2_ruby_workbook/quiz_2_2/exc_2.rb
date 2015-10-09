

munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def update_age_group(family)
  family.each do |k, v|
    v["age_group"] = 
      case v.fetch("age")
      when 0..17
        "kid"
      when 18..64
        "adult"
      else
        v.fetch("age") >= 65 ? "senior" : "not born yet"
      end
  end
end

def report(family)
  family.each do |k, v|
    puts "#{k} is a #{ v["age"] } year old #{ v["age_group"] } #{ v["gender"] }."
  end
end

update_age_group(munsters)
report(munsters)

puts "---------------"

munsters["Wesley"] = {"age" => -1, "gender" => "male"}

update_age_group(munsters)
report(munsters)



