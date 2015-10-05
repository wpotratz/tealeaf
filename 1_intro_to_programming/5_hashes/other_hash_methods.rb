

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

parents = { mom: ["ellen"], dad: ["steve"] }

family.each_key { |k| puts k }

puts "-----------"

family.each_value { |v| puts v }

puts "-----------"

family.each { |k,v| puts "Here's the key: #{k}, and here's the value: #{v}" }