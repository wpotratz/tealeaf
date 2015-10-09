

message = "The Flintstones Rock!"

def post_message(message)
  s = ""
  10.times do |m|
    print s 
    puts message
    s = s + " "
  end
end

post_message(message)
