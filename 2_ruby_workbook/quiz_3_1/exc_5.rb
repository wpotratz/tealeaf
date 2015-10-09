def is_a_number?(input)
  value_check = input.to_s
  if /[^0-9]/.match(value_check)
    false
  else
    true
  end
end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end

puts dot_separated_ip_address?("1.2.3.4.5")
puts dot_separated_ip_address?("ab.c.1.2")
puts dot_separated_ip_address?("23.1.2.2")

