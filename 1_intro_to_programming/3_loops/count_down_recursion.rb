

def countdown(num)
  puts num
  if num > 0
    countdown(num - 1)
  end
end

countdown(5)