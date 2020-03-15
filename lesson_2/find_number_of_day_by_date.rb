# frozen_string_literal: true

# User enter day, month, year. Find number of day

puts 'Enter day, month, year (d.m.y): '
date = gets.chomp.split('.').map(&:to_i)
leap_year =
  if (date[2] % 400).zero?
    true
  elsif (date[2] % 4).zero?
    (date[2] % 100).zero? ? false : true
  else
    false
  end

index = 1
number_of_day = date[0]
while index < date[1]
  number_of_day += (index % 2).zero? ? 30 : 31
  index += 1
end
if date[1] > 2
  number_of_day -= leap_year ? 1 : 2
end
number_of_day += 1 if date[1] > 7

puts "Your number of day is #{number_of_day}"
