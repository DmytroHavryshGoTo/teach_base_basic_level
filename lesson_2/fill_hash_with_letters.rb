# frozen_string_literal: true

# Fill the hash with vowel letters where key is letter and value is position

abc = {}
vowels = %w[a e i o u]
letters = ('a'..'z').to_a
index = 0
while index < letters.length
  abc[letters[index]] = (index + 1) if vowels.include? letters[index]
  index += 1
end
