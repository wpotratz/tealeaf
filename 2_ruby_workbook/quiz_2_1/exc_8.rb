def titelize(input)
  skip_word = %w(and the a it if in to at of or is)
  input.downcase.split(" ").each { |w| w.capitalize! }.join(" ")
end

puts titelize("Well hello there, old boy! It is a nice day.")