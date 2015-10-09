

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.select { |v| v.index("Be") == 0 }.first