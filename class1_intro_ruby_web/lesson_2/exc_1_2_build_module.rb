
module Yell
  def yell(words)
    words.upcase!
  end
end

class WesClass
  include Yell
end

person1 = WesClass.new

p person1.yell("I don't know what we're yelling about!!")