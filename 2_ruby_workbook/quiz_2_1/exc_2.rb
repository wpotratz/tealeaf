

statement = "The Flintstones Rock"

letters = statement.downcase.split("").sort.uniq.select {|n| /[a-z]/.match(n) }

letter_count = {}

letters.each do |l|
  letter_count[l] = statement.count l
end

puts letter_count