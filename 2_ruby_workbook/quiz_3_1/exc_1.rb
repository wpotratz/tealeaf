
## The variable 'greeting' is created, but not yet defined because the if 
## statement evaluated to false, and the variable declaration was therefore 
## not executed. Also, listing the variable does not show you the value when
## executed. Use puts or p to show the value on the screen.

if false
  greeting = “hello world”
end

greeting

## To make something happen, I can change it this way:

if false
  true
else
  greeting = "hello world"
end

p greeting