
# exc_1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones


# exc_2
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << "Dino"


# exc_3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino", "Hoppy")
flintstones.push("Dino").push("Hoppy")

flintstones.concat(["Dino", "Hoppy"])


# exc_4
advice = "Few things in life are as important as house training your pet dinosaur."

advice[0, advice.index("house")]

advice.slice!(0, advice.index("house"))


# exc_5
statement = "The Flintstones Rock!"

statement.count("t")

statement.scan('t').count


# exc_6

title = "Flintstone Family Members"

table_width = 40

pad_size = (table_width - title.length) / 2

def pad(width, title)
  pad_size = (width - (title.length)) / 2
  pad_size.times { print " " }
end

pad(table_width, title)

print pad(table_width, title) 
print title 
print pad(table_width, title)
