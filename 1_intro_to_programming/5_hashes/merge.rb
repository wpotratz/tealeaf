


family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

parents = { mom: ["ellen"], dad: ["steve"] }


puts "Here is the result of the 'merge' method"
puts family.merge(parents)
puts "As we can see here, the family hash is still intact"
puts family
puts ""
puts "Here, I'm mutating the caller with the 'merge!' method"
puts family.merge!(parents)
puts "And here, is the original hash. Notice the values have changed:"
puts family