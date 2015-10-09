
def hex_gen(n)
  hex_values = ("0".."9").map { |num| num } + ("a".."f").map { |l| l }
  key = ""
  while n > 0
    key =  key + hex_values[rand(hex_values.size)].to_s
    n -= 1
  end
  print key
end

def uuid_gen
  print hex_gen(8)
  print "-"
  print hex_gen(4)  
  print "-"
  print hex_gen(4)  
  print "-"
  print hex_gen(4)  
  print "-"
  print hex_gen(12)
end

puts uuid_gen()
puts uuid_gen()
puts uuid_gen()
