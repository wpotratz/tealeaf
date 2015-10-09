
## Original Code
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end


## Improved Code
def factors(number)
  dividend = number
  divisors = []
  until dividend <= 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(64)
p factors(0)