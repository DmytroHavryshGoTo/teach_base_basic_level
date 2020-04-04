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

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
number_of_day = months.first(date[1] - 1).sum + date[0]
number_of_day += 1 if leap_year

puts "Your number of day is #{number_of_day}"
