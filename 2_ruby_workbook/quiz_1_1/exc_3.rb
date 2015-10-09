advice = "Few things in life are as important as house training your pet dinosaur."

def word_replace (input, old_word, new_word)
  
  input = input.split(" ")
  
  input.each_with_index do|word, index| 
    if word == old_word
      then 
        input[index]=new_word
    end
  end
  input.join(" ")
end

puts advice
puts word_replace(advice,"important", "urgent")
puts advice

advice = word_replace(advice,"important", "urgent")

puts advice

advice = word_replace(advice,"urgent", "rediculous")

puts advice

advice = word_replace(advice,"rediculous", "important")

puts advice

advice = word_replace(advice,"important", "urgent")

puts advice