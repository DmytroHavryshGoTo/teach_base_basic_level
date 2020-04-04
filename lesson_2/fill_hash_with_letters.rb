# frozen_string_literal: true

# Fill the hash with vowel letters where key is letter and value is position

abc = {}
vowels = %w[a e i o u]
letters = ('a'..'z').to_a

vowels.each do |vowel|
  abc[vowel] = letters.index(vowel) + 1
end
