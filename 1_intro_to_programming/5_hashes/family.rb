

# Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
          
immediate_family = family.select { |k,v| k == :sisters || k == :brothers }

puts family.to_s
puts immediate_family.to_s
puts "------"
puts family
puts immediate_family