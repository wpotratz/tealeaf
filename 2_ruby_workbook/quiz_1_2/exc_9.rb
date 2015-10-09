

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones

#flintstones.map! { |v| v[0..2] }
flintstones.map! { |v| v[0, 3] }

p flintstones