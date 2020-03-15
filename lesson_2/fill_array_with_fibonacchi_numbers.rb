# frozen_string_literal: true

# Fill the array with fibonacchi numbers up to 100

fibonacchi_numbers = []
prev = 0
current = 1
while current <= 100
  fibonacchi_numbers << current
  tmp = current
  current += prev
  prev = tmp
end
print fibonacchi_numbers
